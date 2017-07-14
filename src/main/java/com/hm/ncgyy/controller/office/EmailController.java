package com.hm.ncgyy.controller.office;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.office.EmailEntity;
import com.hm.ncgyy.entity.office.EmailFileEntity;
import com.hm.ncgyy.entity.office.ReceiveEntity;
import com.hm.ncgyy.entity.office.SendEntity;
import com.hm.ncgyy.entity.office.SendEntity.SendStatus;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.office.EmailService;
import com.hm.ncgyy.service.office.ReceiveService;
import com.hm.ncgyy.service.office.SendService;

@RestController
public class EmailController {

	static Logger log = LoggerFactory.getLogger(EmailController.class);

	@Autowired
	EmailService emailService;

	@Autowired
	SendService sendService;

	@Autowired
	ReceiveService receiveService;

	@Autowired
	UserService userService;

	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/email/send", method = RequestMethod.POST)
	public Result send(String receivers, String title, String content,
			@RequestParam("attachmentList") List<String> attachmentList, Long userId) {
		try {
			Date now = new Date();
			
			String path = commonService.saveEmail(content);
			EmailEntity email = new EmailEntity(title, path, now, now);
			emailService.save(email);
			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				EmailFileEntity emailFile = new EmailFileEntity(email.getId(), filename, filepath, now, now);
				emailService.saveFile(emailFile);
			}
			
			// 发件箱
			UserBaseEntity sender = userService.findOneBase(userId);
			SendEntity send = new SendEntity(email, sender, receivers, SendStatus.SEND, now, now, now);
			sendService.save(send);

			// 收件箱
			for (String receiverUsername : receivers.split(",")) {
				UserBaseEntity receiver = userService.findByUsernameBase(receiverUsername);
				ReceiveEntity receive = new ReceiveEntity(email, receiver, sender, now, now, now);
				receiveService.save(receive);
			}

			return new Result(Code.SUCCESS.value(), "sended");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/email/draft", method = RequestMethod.POST)
	public Result draft(String receivers, String title, String content,
			@RequestParam("attachmentList") List<String> attachmentList, Long userId) {
		try {
			Date now = new Date();
			
			String path = commonService.saveEmail(content);
			EmailEntity email = new EmailEntity(title, path, now, now);
			emailService.save(email);
			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				EmailFileEntity emailFile = new EmailFileEntity(email.getId(), filename, filepath, now, now);
				emailService.saveFile(emailFile);
			}

			UserBaseEntity sender = userService.findOneBase(userId);
			SendEntity send = new SendEntity(email, sender, receivers, SendStatus.DRAFT, null, now, now);
			sendService.save(send);

			return new Result(Code.SUCCESS.value(), "draft");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

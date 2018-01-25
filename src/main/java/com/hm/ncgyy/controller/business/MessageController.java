package com.hm.ncgyy.controller.business;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.business.MessageEntity;
import com.hm.ncgyy.service.business.MessageService;

@RestController
public class MessageController {

	static Logger log = LoggerFactory.getLogger(MessageController.class);

	@Autowired
	MessageService messageService;

	@RequestMapping(value = "/api/business/message/create", method = RequestMethod.POST)
	public Result create(String name, String contact, String area, String email, String qq, String content) {
		try {
			Date now = new Date();
			MessageEntity message = new MessageEntity(name, contact, area, email, qq, content, now, now);
			messageService.save(message);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/business/message/deleteBatch")
	public Result deleteBatch(@RequestParam("messageIdList[]") List<Long> messageIdList) {
		try {
			messageService.delete(messageIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/business/message/get")
	public Result get(Long messageId) {
		try {
			MessageEntity message = messageService.findOne(messageId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", message);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/business/message/list")
	public Result list() {
		try {
			List<MessageEntity> list = messageService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

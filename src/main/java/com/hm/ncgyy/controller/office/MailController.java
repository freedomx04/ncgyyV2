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
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.common.utils.CommonUtils;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.office.MailEntity;
import com.hm.ncgyy.entity.office.MailEntity.DeleteStatus;
import com.hm.ncgyy.entity.office.MailEntity.MailStatus;
import com.hm.ncgyy.entity.office.MailEntity.PointStatus;
import com.hm.ncgyy.entity.office.MailFileEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.office.MailService;

@RestController
public class MailController {

	static Logger log = LoggerFactory.getLogger(MailController.class);

	@Autowired
	MailService mailService;
	
	@Autowired
	UserService userService;

	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/mail/send", method = RequestMethod.POST)
	public Result send(String receivers, String title, String content,
			@RequestParam("attachmentList") List<String> attachmentList, Long userId) {
		try {
			Date now = new Date();
			UserBaseEntity sender = userService.findOneBase(userId);
			String path = commonService.saveMail(content);
			
			MailEntity mail = new MailEntity(receivers, title, path, sender, now, now);
			mail.setMailStatus(MailStatus.SEND);
			mail.setSendTime(now);
			mailService.save(mail);
			
			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				String fileIcon = CommonUtils.getIcon(filename);
				MailFileEntity mailFile = new MailFileEntity(mail.getId(), filename, filepath, fileIcon, now, now);
				mailService.saveFile(mailFile);
			}

			List<MailFileEntity> fileList = mailService.getFileList(mail.getId());
			// 发送邮件
			for (String username: receivers.split(",")) {
				UserBaseEntity receiver = userService.findByUsernameBase(username);
				MailEntity receiveMail = new MailEntity(receivers, title, path, fileList, sender, receiver, now, now, now);
				receiveMail.setMailStatus(MailStatus.RECEIVE);
				mailService.save(receiveMail);
			}

			return new Result(Code.SUCCESS.value(), "sended");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/draftAdd", method = RequestMethod.POST)
	public Result draftAdd(String receivers, String title, String content,
			@RequestParam("attachmentList") List<String> attachmentList, Long userId) {
		try {
			UserBaseEntity sender = userService.findOneBase(userId);
			Date now = new Date();
			String path = commonService.saveMail(content);
			MailEntity mail = new MailEntity(receivers, title, path, sender, now, now);
			mail.setMailStatus(MailStatus.DRAFT);
			mailService.save(mail);

			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				String fileIcon = CommonUtils.getIcon(filename);
				MailFileEntity mailFile = new MailFileEntity(mail.getId(), filename, filepath, fileIcon, now, now);
				mailService.saveFile(mailFile);
			}

			return new Result(Code.SUCCESS.value(), "draft created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/draftUpdate", method = RequestMethod.POST)
	public Result draftUpdate(Long mailId, String receivers, String title, String content,
			@RequestParam("attachmentList") List<String> attachmentList) {
		try {
			Date now = new Date();
			MailEntity mail = mailService.findOne(mailId);
			mail.setReceivers(receivers);
			mail.setTitle(title);
			commonService.updateMail(mail.getPath(), content);
			mail.setUpdateTime(now);
			mailService.save(mail);

			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				String fileIcon = CommonUtils.getIcon(filename);
				MailFileEntity mailFile = new MailFileEntity(mail.getId(), filename, filepath, fileIcon, now, now);
				mailService.saveFile(mailFile);
			}

			return new Result(Code.SUCCESS.value(), "draft updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/draftSend", method = RequestMethod.POST)
	public Result draftSend(Long mailId, String receivers, String title, String content, @RequestParam("attachmentList") List<String> attachmentList) {
		try {
			Date now = new Date();
			MailEntity mail = mailService.findOne(mailId);
			mail.setReceivers(receivers);
			mail.setTitle(title);
			commonService.updateMail(mail.getPath(), content);
			mail.setMailStatus(MailStatus.SEND);
			mail.setUpdateTime(now);
			mail.setSendTime(now);
			mailService.save(mail);
			
			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				String fileIcon = CommonUtils.getIcon(filename);
				MailFileEntity mailFile = new MailFileEntity(mail.getId(), filename, filepath, fileIcon, now, now);
				mailService.saveFile(mailFile);
			}
			
			List<MailFileEntity> fileList = mailService.getFileList(mail.getId());
			// 发送邮件
			for (String username: receivers.split(",")) {
				UserBaseEntity receiver = userService.findByUsernameBase(username);
				MailEntity receiveMail = new MailEntity(receivers, title, mail.getPath(), fileList, mail.getSender(), receiver, now, now, now);
				receiveMail.setMailStatus(MailStatus.RECEIVE);
				mailService.save(receiveMail);
			}
			
			return new Result(Code.SUCCESS.value(), "send success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/listInbox")
	public Result listInbox(Long userId) {
		try {
			List<MailEntity> list = mailService.listInbox(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/listPoint")
	public Result listPoint(Long userId) {
		try {
			List<MailEntity> list = mailService.listPoint(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/listDraft")
	public Result listDraft(Long userId) {
		try {
			List<MailEntity> list = mailService.listDraft(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/listSend")
	public Result listSend(Long userId) {
		try {
			List<MailEntity> list = mailService.listSend(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/listDelete")
	public Result listDelete(Long userId) {
		try {
			List<MailEntity> list = mailService.listDelete(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/delete")
	public Result delete(@RequestParam("mailIdList[]") List<Long> mailIdList) {
		try {
			for (Long mailId: mailIdList) {
				MailEntity mail = mailService.findOne(mailId);
				mail.setDeleteStatus(DeleteStatus.DELETED);
				mailService.save(mail);
			}
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/deleteCompletely")
	public Result deleteCompletely(@RequestParam("mailIdList[]") List<Long> mailIdList) {
		try {
			for (Long mailId: mailIdList) {
				MailEntity mail = mailService.findOne(mailId);
				List<MailFileEntity> fileList = mail.getFileList();
				for (MailFileEntity file: fileList) {
					commonService.deleteFile(file.getFilepath());
					mailService.deleteFile(file);
				}
				mailService.delete(mail);
			}
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/point")
	public Result point(@RequestParam("mailIdList[]") List<Long> mailIdList) {
		try {
			for (Long mailId: mailIdList) {
				MailEntity mail = mailService.findOne(mailId);
				mail.setPointStatus(PointStatus.POINT);
				mailService.save(mail);
			}
			return new Result(Code.SUCCESS.value(), "point");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/unpoint")
	public Result unpoint(@RequestParam("mailIdList[]") List<Long> mailIdList) {
		try {
			for (Long mailId: mailIdList) {
				MailEntity mail = mailService.findOne(mailId);
				mail.setPointStatus(PointStatus.UNPOINT);
				mailService.save(mail);
			}
			return new Result(Code.SUCCESS.value(), "unpoint");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/mail/recovery")
	public Result read(@RequestParam("mailIdList[]") List<Long> mailIdList) {
		try {
			for (Long mailId: mailIdList) {
				MailEntity mail = mailService.findOne(mailId);
				mail.setDeleteStatus(DeleteStatus.NOT_DELETE);
				mailService.save(mail);
			}
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

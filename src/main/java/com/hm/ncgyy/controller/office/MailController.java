package com.hm.ncgyy.controller.office;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
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
import com.hm.ncgyy.entity.office.MailEntity.ReadStatus;
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

			MailEntity mail = new MailEntity(receivers, title, sender, now, now);
			mail.setMailStatus(MailStatus.SEND);
			mail.setReadStatus(ReadStatus.READ);
			mail.setSendTime(now);
			mailService.save(mail);

			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				String fileIcon = CommonUtils.getIcon(filename);
				MailFileEntity mailFile = new MailFileEntity(mail.getId(), filename, filepath, fileIcon, now, now);
				mailService.saveFile(mailFile);
			}

			// 发送邮件
			for (String username : receivers.split(",")) {
				UserBaseEntity receiver = userService.findByUsernameBase(username);
				MailEntity receiveMail = new MailEntity(receivers, title, sender, receiver, now, now, now);
				receiveMail.setMailStatus(MailStatus.RECEIVE);
				mailService.save(receiveMail);

				for (String attachment : attachmentList) {
					String filename = StringUtils.split(attachment, "?")[0];
					String filepath = StringUtils.split(attachment, "?")[1];
					String fileIcon = CommonUtils.getIcon(filename);
					MailFileEntity mailFile = new MailFileEntity(receiveMail.getId(), filename, filepath, fileIcon, now,
							now);
					mailService.saveFile(mailFile);
				}
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
			MailEntity mail = new MailEntity(receivers, title, sender, now, now);
			mail.setMailStatus(MailStatus.DRAFT);
			mail.setReadStatus(ReadStatus.READ);
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
			mail.setContent(content);
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
	public Result draftSend(Long mailId, String receivers, String title, String content,
			@RequestParam("attachmentList") List<String> attachmentList) {
		try {
			Date now = new Date();
			MailEntity mail = mailService.findOne(mailId);
			mail.setReceivers(receivers);
			mail.setTitle(title);
			mail.setContent(content);
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

			// 发送邮件
			for (String username : receivers.split(",")) {
				UserBaseEntity receiver = userService.findByUsernameBase(username);
				MailEntity receiveMail = new MailEntity(receivers, title, mail.getSender(), receiver, now, now, now);
				receiveMail.setMailStatus(MailStatus.RECEIVE);
				mailService.save(receiveMail);

				for (String attachment : attachmentList) {
					String filename = StringUtils.split(attachment, "?")[0];
					String filepath = StringUtils.split(attachment, "?")[1];
					String fileIcon = CommonUtils.getIcon(filename);
					MailFileEntity mailFile = new MailFileEntity(receiveMail.getId(), filename, filepath, fileIcon, now,
							now);
					mailService.saveFile(mailFile);
				}
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
			for (Long mailId : mailIdList) {
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
			for (Long mailId : mailIdList) {
				MailEntity mail = mailService.findOne(mailId);
				List<MailFileEntity> fileList = mail.getFileList();
				for (MailFileEntity file : fileList) {
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
			for (Long mailId : mailIdList) {
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
			for (Long mailId : mailIdList) {
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
			for (Long mailId : mailIdList) {
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

	@RequestMapping(value = "/api/mail/unread")
	public Result unread(Long userId) {
		try {
			Integer unread_inbox = 0;
			Integer unread_point = 0;
			Integer unread_delete = 0;

			// 收件箱未读
			List<MailEntity> inboxList = mailService.listInbox(userId);
			for (MailEntity mail : inboxList) {
				if (mail.getReadStatus() == ReadStatus.UNREAD) {
					unread_inbox++;
				}
			}

			// 星标邮件未读
			List<MailEntity> pointList = mailService.listPoint(userId);
			for (MailEntity mail : pointList) {
				if (mail.getReadStatus() == ReadStatus.UNREAD) {
					unread_point++;
				}
			}

			// 已删除未读
			List<MailEntity> deleteList = mailService.listDelete(userId);
			for (MailEntity mail : deleteList) {
				if (mail.getReadStatus() == ReadStatus.UNREAD) {
					unread_delete++;
				}
			}

			List<Integer> ret = new LinkedList<>();
			ret.add(unread_inbox);
			ret.add(unread_point);
			ret.add(unread_delete);
			return new ResultInfo(Code.SUCCESS.value(), "ok", ret);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/inboxUnread")
	public Result inboxUnread(Long userId) {
		try {
			List<MailEntity> retList = new LinkedList<>();

			List<MailEntity> inboxList = mailService.listInbox(userId);
			for (MailEntity mail : inboxList) {
				if (mail.getReadStatus() == ReadStatus.UNREAD) {
					retList.add(mail);
				}
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", retList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/mail/search")
	public Result search(Long userId, String input, String type) {
		List<MailEntity> list = new ArrayList<MailEntity>();
		try {
			switch (type) {
			case "inbox":
				list = mailService.searchInbox(userId, input);
				break;
			case "point":
				list = mailService.searchPoint(userId, input);
				break;
			case "draft":
				list = mailService.searchDraft(userId, input);
				break;
			case "send":
				list = mailService.searchSend(userId, input);
				break;
			case "delete":
				list = mailService.searchDelete(userId, input);

			}
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

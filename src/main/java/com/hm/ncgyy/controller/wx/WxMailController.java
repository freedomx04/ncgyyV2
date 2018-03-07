package com.hm.ncgyy.controller.wx;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.common.wx.WxUtil;
import com.hm.ncgyy.entity.office.MailEntity;
import com.hm.ncgyy.entity.office.MailEntity.ReadStatus;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.office.MailService;

@Controller
public class WxMailController {
	
	static Logger log = LoggerFactory.getLogger(WxMailController.class);
	
	@Autowired
	MailService mailService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/wx/mail")
	String rank(ModelMap modelMap) {
		//return "wx/office/menu";
		return WxUtil.getInstace().redirect(modelMap, request, userService, "wx/office/menu");
	}
	
	@RequestMapping(value = "/wx/mail/list")
	String inbox(ModelMap modelMap, Long userId, String type) {
		List<MailEntity> list = new ArrayList<MailEntity>();
		switch (type) {
		case "inbox":
			list = mailService.listInbox(userId);
			break;
		case "point":
			list = mailService.listPoint(userId);
			break;
		case "draft":
			list = mailService.listDraft(userId);
			break;
		case "send":
			list = mailService.listSend(userId);
			break;
		case "delete":
			list = mailService.listDelete(userId);
			
		}
		modelMap.addAttribute("mailList", list);
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("userId", userId);
		
		return "wx/office/mail_list";
	}
	
	@RequestMapping(value = "/wx/mailinfo")
	String mailInfo(ModelMap modelMap, Long userId, Long mailId, String type) throws IOException {
		MailEntity mail = mailService.findOne(mailId);
		if (mail.getReadStatus() == ReadStatus.UNREAD) {
			mail.setReadStatus(ReadStatus.READ);
			mailService.save(mail);
		}
		
		modelMap.addAttribute("mail", mail);
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("userId", userId);
		return "wx/office/mail_info";
	}
}

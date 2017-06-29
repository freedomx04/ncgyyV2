package com.hm.ncgyy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.common.utils.CurrentUserUtils;
import com.hm.ncgyy.entity.authority.UserEntity;

@Controller
public class BaseController {
	
	static Logger log = LoggerFactory.getLogger(BaseController.class);
	
	@RequestMapping(value = { "/", "/index" })
	String index() {
		return "index";
	}
	
	@RequestMapping(value = "/home")
	String home(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "home";
	}
	
	@RequestMapping(value = "/overview")
	String overview() {
		return "overview";
	}
	
	@RequestMapping(value = "/login")
	String login() {
		return "login";
	}
	
	/**
	 * 权限管理接口
	 */
	
	
}

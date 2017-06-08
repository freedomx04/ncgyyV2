package com.hm.ncgyy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BaseController {
	
	static Logger log = LoggerFactory.getLogger(BaseController.class);
	
	@RequestMapping(value = { "/", "/index" })
	String index() {
		return "index";
	}
	
	@RequestMapping(value = "/home")
	String home() {
		return "home";
	}
	
	@RequestMapping(value = "/overview")
	String overview() {
		return "overview";
	}
	
	/**
	 * 权限管理接口
	 */
	
	
}

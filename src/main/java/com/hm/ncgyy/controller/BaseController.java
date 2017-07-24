package com.hm.ncgyy.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.common.utils.CurrentUserUtils;
import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.service.assist.AppealService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.ProductService;
import com.hm.ncgyy.service.issue.ArticleService;

@Controller
public class BaseController {
	
	static Logger log = LoggerFactory.getLogger(BaseController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	AppealService appealService;
	
	@RequestMapping(value = { "/", "/index" })
	String index(ModelMap modelMap) {
		Page<ArticleEntity> list = null;
		
		// 图片新闻
		list = articleService.listByType(1, 0, 5);
		modelMap.addAttribute("photonewsList", list.getContent());
		
		// 公示公告
		list = articleService.listByType(2, 0, 5);
		modelMap.addAttribute("announceList", list.getContent());
		
		// 政策法规
		list = articleService.listByType(2, 0, 5);
		modelMap.addAttribute("policyList", list.getContent());
		
		// 工业信息
		list = articleService.listByType(3, 0, 5);		
		modelMap.addAttribute("overviewList", list.getContent());
		
		// 企业信息
		Page<EnterpriseBaseEntity> enterprisePage = enterpriseService.listBase(0, 20);
		modelMap.addAttribute("enterpriseList", enterprisePage.getContent());
		
		// 产品信息
		List<ProductEntity> productList = productService.listPaging(0, 20);
		modelMap.addAttribute("productList", productList);
		
		// 帮扶平台
		Page<AppealEntity> appealPage = appealService.listPaging(0, 5);
		modelMap.addAttribute("appealList", appealPage.getContent());
		
		return "index";
	}
	
	@RequestMapping(value = "/home")
	String home(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "home";
	}
	
	@RequestMapping(value = "/login")
	String login() {
		return "login";
	}
	
	@RequestMapping(value = "/register")
	String register() {
		return "register";
	}
	
	@RequestMapping(value = "/forgetpsw")
	String forgetpsw() {
		return "forgetpsw";
	}
	
	@RequestMapping(value = "/init")
	String init() {
		return "init";
	}
	
}

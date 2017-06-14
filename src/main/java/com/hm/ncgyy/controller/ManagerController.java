package com.hm.ncgyy.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.issue.ArticleService;

@Controller
public class ManagerController {
	
	static Logger log = LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	/**
	 * 企业接口
	 */
	@RequestMapping(value = "/enterpriseList")
	String enterprise() {
		return "pages/authority/enterprise_list";
	}
	
	@RequestMapping(value = "/department")
	String department() {
		return "pages/authority/department";
	}
	
	/**
	 * 基础数据接口
	 */
	@RequestMapping(value = "/area")
	String area() {
		return "pages/base/area";
	}
	
	@RequestMapping(value = "/industry")
	String industry() {
		return "pages/base/industry";
	}
		
	/**
	 * 新闻发布接口
	 */
	@RequestMapping(value = "/articleList")
	String articleList(ModelMap modelMap, Integer type) {
		String title = articleService.getArticleTitle(type);
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("type", type);
		
		return "pages/issue/article_list";
	}
	
	@RequestMapping(value = "/articleAdd")
	String articleAdd(ModelMap modelMap, Integer type, String method, Long articleId) throws IOException {
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("method", method);
		
		String title = articleService.getArticleTitle(type);
		title += method.equals("add") ? " - 新增" : " - 编辑";
		modelMap.addAttribute("title", title);
		
		if (articleId != null) {
			ArticleEntity article = articleService.findOne(articleId);
			String content = commonService.getArticleContent(article.getPath());
			article.setContent(content);
			modelMap.addAttribute("article", article);
		}
		
		return "pages/issue/article_add";
	}
	
	@RequestMapping(value = "/articleGet/{path}")
	String articleGet(ModelMap modelMap, @PathVariable("path") String path) throws IOException {
		ArticleEntity article = articleService.findByPath(path);
		if (article != null) {
			String content = commonService.getArticleContent(article.getPath());
			article.setContent(content);
			modelMap.addAttribute("article", article);
		}
		
		return "pages/issue/article_get";
	}
	
	/**
	 * 监测平台/主要指标接口
	 */
	@RequestMapping(value = "/target")
	String target() {
		return "pages/target/target";
	}

}

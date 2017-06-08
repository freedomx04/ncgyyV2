package com.hm.ncgyy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.service.issue.ArticleService;

@Controller
public class ManagerController {
	
	static Logger log = LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	ArticleService articleService;
	
	/**
	 * 基础数据接口
	 */
	@RequestMapping(value = "/area")
	String area() {
		return "pages/base/area";
	}
	
	/**
	 * 新闻发布接口
	 */
	@RequestMapping(value = "/articleList")
	String articleList(ModelMap modelMap, Integer type) {
		modelMap.addAttribute("type", type);
		return "pages/issue/article_list";
	}
	
	@RequestMapping(value = "/articleAdd")
	String articleAdd(ModelMap modelMap, Integer type, String method, Long articleId) {
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("method", method);
		
		String title = "";
		switch (type) {
		case 1:		title = "图片新闻";		break;
		case 2:		title = "公示公告";		break;
		case 3:		title = "政策法规";		break;
		case 4:		title = "工业信息";		break;
		default:	break;
		}
		title += method.equals("add") ? " - 新增" : " - 编辑";
		modelMap.addAttribute("title", title);
		
		if (articleId != null) {
			ArticleEntity article = articleService.findOne(articleId);
			modelMap.addAttribute("article", article);
		}
		
		return "pages/issue/article_add";
	}

}

package com.hm.ncgyy.controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.base.AreaService;
import com.hm.ncgyy.service.base.IndustryService;
import com.hm.ncgyy.service.issue.ArticleService;

@Controller
public class ManagerController {
	
	static Logger log = LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	IndustryService industryService;
	
	/**
	 * 企业接口
	 */
	@RequestMapping(value = "/enterpriseList")
	String enterprise() {
		return "pages/authority/enterprise_list";
	}
	
	@RequestMapping(value = "/enterpriseAdd")
	String enterpriseAdd(ModelMap modelMap, String method) {
		List<AreaEntity> areaList = areaService.list();
		List<IndustryEntity> industryList = industryService.list();
		
		String title = method.equals("add") ? "企业新增" : "企业编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		modelMap.addAttribute("areaList", areaList);
		modelMap.addAttribute("industryList", industryList);
		
		return "pages/authority/enterprise_add";
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
	 * 监测平台接口
	 */
	@RequestMapping(value = "/targetImport")
	String targetImport() {
		return "pages/monitor/target_import";
	}
	
	@RequestMapping(value = "/targetEnterprise")
	String targetEnterprise() {
		return "pages/monitor/target_enterprise";
	}
	
	@RequestMapping(value = "/targetIndustry")
	String targetIndustry() {
		return "pages/monitor/target_industry";
	}
	
	@RequestMapping(value = "/targetArea")
	String targetArea() {
		return "pages/monitor/target_area";
	}
	
	@RequestMapping(value = "/targetPointEnterprise")
	String targetPointEnterprise() {
		return "pages/monitor/target_point_enterprise";
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

}

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

import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.NewsService;
import com.hm.ncgyy.service.authority.ProductService;
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
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	NewsService newsService;
	
	/**
	 * 企业接口
	 */
	@RequestMapping(value = "/enterpriseList")
	String enterprise() {
		return "pages/authority/enterprise_list";
	}
	
	@RequestMapping(value = "/enterpriseAdd")
	String enterpriseAdd(ModelMap modelMap, String method, Long enterpriseId) {
		List<AreaEntity> areaList = areaService.list();
		List<IndustryEntity> industryList = industryService.list();
		
		String title = method.equals("add") ? "企业新增" : "企业编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		modelMap.addAttribute("areaList", areaList);
		modelMap.addAttribute("industryList", industryList);
		
		if (enterpriseId != null) {
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			modelMap.addAttribute("enterprise", enterprise);
		}
		
		return "pages/authority/enterprise_add";
	}
	
	@RequestMapping(value = "/enterpriseGet")
	String enterpriseGet(ModelMap modelMap, Long enterpriseId) {
		EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
		modelMap.addAttribute("enterprise", enterprise);
		
		return "pages/authority/enterprise_get";
	}
	
	@RequestMapping(value = "/productAdd")
	String productAdd(ModelMap modelMap, String method, Long productId, Long enterpriseId) {
		String title = method.equals("add") ? "产品新增" : "产品编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("enterpriseId", enterpriseId);
		
		if (productId != null) {
			ProductEntity product = productService.findOne(productId);
			modelMap.addAttribute("product", product);
		}
		
		return "pages/authority/product_add";
	}
	
	@RequestMapping(value = "/productGet")
	String productGet(ModelMap modelMap, Long productId) {
		ProductEntity product = productService.findOne(productId);
		modelMap.addAttribute("product", product);
		
		return "pages/authority/product_get";
	}
	
	@RequestMapping(value = "/newsAdd")
	String newsAdd(ModelMap modelMap, String method, Long newsId, Long enterpriseId) throws IOException {
		String title = method.equals("add") ? "新闻新增" : "新闻编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("enterpriseId", enterpriseId);
		
		if (newsId != null) {
			NewsEntity news = newsService.findOne(newsId);
			String content = commonService.getArticleContent(news.getPath());
			news.setContent(content);
			modelMap.addAttribute("news", news);
		}
		
		return "pages/authority/news_add";
	}
	
	@RequestMapping(value = "/newsGet")
	String newsGet(ModelMap modelMap, Long newsId) throws IOException {
		NewsEntity news = newsService.findOne(newsId);
		String content = commonService.getArticleContent(news.getPath());
		news.setContent(content);
		modelMap.addAttribute("news", news);
		
		return "pages/authority/news_get";
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
			
			String title = articleService.getArticleTitle(article.getType());
			modelMap.addAttribute("title", title);
		}
		
		return "pages/issue/article_get";
	}

}

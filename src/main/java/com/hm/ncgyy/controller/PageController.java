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

import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.assist.AppealService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.NewsService;
import com.hm.ncgyy.service.authority.ProductService;
import com.hm.ncgyy.service.issue.ArticleService;

@Controller
public class PageController {
	
	static Logger log = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	NewsService newsService;
	
	@Autowired
	AppealService appealService;
	
	/**
	 * 新闻页面
	 */
	@RequestMapping(value = "/newslist")
	String article(ModelMap modelMap, Integer type) {
		List<ArticleEntity> list = articleService.listByType(type);
		modelMap.addAttribute("count", list.size());
		return "pages/portal/article";
	}
	
	@RequestMapping(value = "/news/{path}")
	String articleContent(ModelMap modelMap, @PathVariable("path") String path) throws IOException {
		ArticleEntity article = articleService.findByPath(path);
		if (article != null) {
			String content = commonService.getArticleContent(article.getPath());
			article.setContent(content);
			modelMap.addAttribute("article", article);
		}
		return "pages/portal/content";
	}
	
	@RequestMapping(value = "/epnews")
	String newsContent(ModelMap modelMap, Long newsId, Long enterpriseId) throws IOException {
		NewsEntity news = newsService.findOne(newsId);
		if (news != null) {
			String content = commonService.getArticleContent(news.getPath());
			news.setContent(content);
			modelMap.addAttribute("news", news);
			modelMap.addAttribute("enterpriseId", enterpriseId);
		}
		
		return "pages/portal/epnews";
	}
	
	@RequestMapping(value = "/enterpriselist")
	String enterprise(ModelMap modelMap) {
		List<EnterpriseEntity> list = enterpriseService.list();
		modelMap.addAttribute("count", list.size());
		return "pages/portal/enterprise";
	}
	
	@RequestMapping(value = "/enterprise")
	String enterpriseInfo(ModelMap modelMap, Long enterpriseId) {
		EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
		modelMap.addAttribute("enterprise", enterprise);
		return "pages/portal/enterpriseinfo";
	}
	
	@RequestMapping(value = "/productlist")
	String product(ModelMap modelMap, Integer type) {
		List<ProductEntity> list = productService.list();
		modelMap.addAttribute("count", list.size());
		return "pages/portal/product";
	}
	
	@RequestMapping(value = "/product")
	String productInfo(ModelMap modelMap, Long productId) {
		ProductEntity product = productService.findOne(productId);
		modelMap.addAttribute("product", product);
		return "pages/portal/productinfo";
	}

	/**
	 * 监测平台页面
	 */
	@RequestMapping(value = "/monitorlist")
	String monitor() {
		return "pages/portal/monitor";
	}
	
	/**
	 * 监测平台页面
	 */
	@RequestMapping(value = "/assistlist")
	String assist() {
		return "pages/portal/assist";
	}
	
	@RequestMapping(value = "/assist")
	String assistInfo(ModelMap modelMap, Long appealId) {
		AppealEntity appeal = appealService.findOne(appealId);
		modelMap.addAttribute("appeal", appeal);
		return "pages/portal/assistinfo";
	}
}

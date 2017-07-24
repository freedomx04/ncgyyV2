package com.hm.ncgyy.controller.wx;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.NewsService;
import com.hm.ncgyy.service.authority.ProductService;

@Controller
public class WxEnterpriseController {
	
	static Logger log = LoggerFactory.getLogger(WxEnterpriseController.class);
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	NewsService newsService;
	
	@Autowired
	CommonService commonService;
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@RequestMapping(value = "/wx/enterprise")
	String enterprise(ModelMap modelMap) {
		List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
		modelMap.addAttribute("enterpriseList", enterpriseList);
		
		return "wx/enterprise/enterprise_list";
	}
	
	@RequestMapping(value = "/wx/enterprise/get")
	String enterprise_get(ModelMap modelMap, Long enterpriseId) {
		EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
		modelMap.addAttribute("enterprise", enterprise);
		
		return "wx/enterprise/enterprise_info";
	}
	
	@RequestMapping(value = "/wx/enterprise/product")
	String enterprise_product(ModelMap modelMap, Long productId) {
		ProductEntity product = productService.findOne(productId);
		modelMap.addAttribute("product", product);
		
		return "wx/enterprise/enterprise_product";
	}
	
	@RequestMapping(value = "/wx/enterprise/news")
	String enterprise_news(ModelMap modelMap, Long newsId) throws IOException {
		NewsEntity news = newsService.findOne(newsId);
		String content = commonService.getArticleContent(news.getPath());
		news.setContent(content);
		
		modelMap.addAttribute("news", news);
		return "wx/enterprise/enterprise_news";
	}
	
	@RequestMapping(value = "/wx/product")
	String product(ModelMap modelMap) {
		return "wx/enterprise/product";
	}
	
}

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

import com.hm.ncgyy.entity.website.ArticleEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.website.ArticleService;

@Controller
public class WxArticleController {

	static Logger log = LoggerFactory.getLogger(WxArticleController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@RequestMapping(value = "/wx/article")
	String article(ModelMap modelMap) {
		List<ArticleEntity> list = articleService.listByType(1);
		modelMap.addAttribute("list", list);
		
		return "wx/issue/article";
	}
	
	@RequestMapping(value = "/wx/article/get")
	String article_get(ModelMap modelMap, Long articleId) throws IOException {
		ArticleEntity article = articleService.findOne(articleId);
		modelMap.addAttribute("article", article);
		return "wx/issue/article_get";
	}
	
}

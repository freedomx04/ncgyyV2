package com.hm.ncgyy.controller.issue;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.issue.ArticleService;

@RestController
public class ArticleController {
	
	static Logger log = LoggerFactory.getLogger(ArticleController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	/**
	 * 新增文章
	 * @param type
	 * @param title
	 * @param source
	 * @param imagePath
	 * @param content
	 * @return
	 */
	@RequestMapping(value = "/api/article/create", method = RequestMethod.POST)
	public Result create(Integer type, String title, String source, String imagePath, String content) {
		try {
			String path = commonService.saveArticle(content);
			Date now = new Date();
			ArticleEntity article = new ArticleEntity(type, title, source, imagePath, path, now, now);
			articleService.save(article);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/article/update", method = RequestMethod.POST)
	public Result update(Long articleId, String title, String source, String imagePath, String content) {
		try {
			
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/article/delete")
	public Result delete(Long articleId) {
		try {
			articleService.delete(articleId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/article/batchDelete")
	public Result batchDelete(@RequestParam("articleIdList[]") List<Long> articleIdList) {
		try {
			articleService.delete(articleIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "api/article/get")
	public Result get(Long articleId) {
		try {
			ArticleEntity article = articleService.findOne(articleId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", article);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/article/list")
	public Result list(Integer type) {
		try {
			List<ArticleEntity> list = articleService.listByType(type);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}

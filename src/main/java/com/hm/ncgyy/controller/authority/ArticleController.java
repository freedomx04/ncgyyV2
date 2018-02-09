package com.hm.ncgyy.controller.authority;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.authority.ArticleEntity;
import com.hm.ncgyy.entity.authority.ArticleFileEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.ArticleFileService;
import com.hm.ncgyy.service.authority.ArticleService;

@RestController
public class ArticleController {

	static Logger log = LoggerFactory.getLogger(ArticleController.class);

	@Autowired
	ArticleService articleService;

	@Autowired
	ArticleFileService articleFileService;

	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/article/create", method = RequestMethod.POST)
	public Result create(Integer type, String title, String source,
			@RequestParam(name = "uploadImage", required = false) MultipartFile uploadImage, String content,
			@RequestParam("attachmentList") List<String> attachmentList) {
		try {
			String imagePath = null;
			if (uploadImage != null) {
				imagePath = commonService.saveImage(uploadImage);
			}

			Date now = new Date();
			ArticleEntity article = new ArticleEntity(type, title, source, imagePath, content, now, now);
			articleService.save(article);

			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				ArticleFileEntity articleFile = new ArticleFileEntity(article.getId(), filename, filepath, now, now);
				articleFileService.save(articleFile);
			}

			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/update", method = RequestMethod.POST)
	public Result update(Long articleId, String title, String source,
			@RequestParam(name = "uploadImage", required = false) MultipartFile uploadImage, String content,
			@RequestParam("attachmentList") List<String> attachmentList) {
		try {
			ArticleEntity article = articleService.findOne(articleId);
			article.setTitle(title);
			article.setSource(source);
			article.setContent(content);
			article.setUpdateTime(new Date());

			if (uploadImage != null && !uploadImage.isEmpty()) {
				commonService.deleteImage(article.getImagePath());
				String imagePath = commonService.saveImage(uploadImage);
				article.setImagePath(imagePath);
			}

			Date now = new Date();
			for (String attachment: attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				ArticleFileEntity articleFile = new ArticleFileEntity(article.getId(), filename, filepath, now, now);
				articleFileService.save(articleFile);
			}
			
			articleService.save(article);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/delete")
	public Result delete(Long articleId) {
		try {
			ArticleEntity article = articleService.findOne(articleId);
			if (article.getImagePath() != null) {
				commonService.deleteImage(article.getImagePath());
			}
			articleService.delete(articleId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/batchDelete")
	public Result batchDelete(@RequestParam("articleIdList[]") List<Long> articleIdList) {
		try {
			for (Long articleId : articleIdList) {
				delete(articleId);
			}
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/get")
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
	
	@RequestMapping(value = "/api/article/listPaging")
	public Result listPaging(Integer type, int page, int size) {
		try {
			Page<ArticleEntity> list = articleService.listByType(type, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/article/fileDelete")
	public Result fileDelete(Long articleFileId) {
		try {
			ArticleFileEntity articleFile = articleFileService.fileOne(articleFileId);
			commonService.deleteFile(articleFile.getFilepath());
			articleFileService.delete(articleFileId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

package com.hm.ncgyy.controller.authority;

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
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.NewsService;

@RestController
public class NewsController {

	static Logger log = LoggerFactory.getLogger(NewsController.class);

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	NewsService newsService;

	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/news/create", method = RequestMethod.POST)
	public Result create(Long enterpriseId, String title, String content) {
		try {
			EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			Date now = new Date();
			NewsEntity news = new NewsEntity(enterprise, title, content, now, now);
			newsService.save(news);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/news/update", method = RequestMethod.POST)
	public Result update(Long newsId, String title, String content) {
		try {
			NewsEntity news = newsService.findOne(newsId);
			news.setTitle(title);
			news.setContent(content);
			news.setUpdateTime(new Date());
			newsService.save(news);

			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/news/delete")
	public Result delete(Long newsId) {
		try {
			newsService.delete(newsId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/news/batchDelete")
	public Result batchDelete(@RequestParam("newsIdList[]") List<Long> newsIdList) {
		try {
			newsService.delete(newsIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/news/get")
	public Result get(Long newsId) {
		try {
			NewsEntity news = newsService.findOne(newsId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", news);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/news/list")
	public Result list(Long enterpriseId) {
		try {
			List<NewsEntity> newsList = newsService.listByEnterpriseId(enterpriseId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", newsList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/news/listPaging")
	public Result listPaging(Long enterpriseId, int page, int size) {
		try {
			List<NewsEntity> newsList = newsService.listByEnterpriseIdPaging(enterpriseId, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", newsList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

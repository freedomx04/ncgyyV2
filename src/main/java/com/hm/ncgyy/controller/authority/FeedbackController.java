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
import com.hm.ncgyy.entity.authority.FeedbackEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.service.authority.FeedbackService;
import com.hm.ncgyy.service.authority.UserService;

@RestController
public class FeedbackController {
	
	static Logger log = LoggerFactory.getLogger(FeedbackEntity.class);
	
	@Autowired
	FeedbackService feedbackService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/api/authority/feedback/create", method = RequestMethod.POST)
	public Result create(Long userId, String content) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			Date now = new Date();
			FeedbackEntity feedback = new FeedbackEntity(user, content, now, now);
			feedbackService.save(feedback);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/authority/feedback/delete")
	public Result delete(Long feedbackId) {
		try {
			feedbackService.delete(feedbackId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/authority/feedback/deleteBatch")
	public Result deleteBatch(@RequestParam("feedbackIdList[]") List<Long> feedbackIdList) {
		try {
			feedbackService.delete(feedbackIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/authority/feedback/get")
	public Result get(Long feedbackId) {
		try {
			FeedbackEntity feedback = feedbackService.findOne(feedbackId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", feedback);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/authority/feedback/list")
	public Result list() {
		try {
			List<FeedbackEntity> list = feedbackService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

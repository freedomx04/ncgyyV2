package com.hm.ncgyy.controller.base;

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
import com.hm.ncgyy.entity.base.AppealTypeEntity;
import com.hm.ncgyy.service.base.AppealTypeService;

@RestController
public class AppealTypeController {
	
	static Logger log = LoggerFactory.getLogger(AppealTypeController.class);
	
	@Autowired
	AppealTypeService typeService;
	
	@RequestMapping(value = "/api/appealType/create", method = RequestMethod.POST)
	public Result create(String name, Integer acceptDays, Integer handleDays) {
		try {
			AppealTypeEntity type = typeService.findByName(name);
			if (type != null) {
				return new Result(Code.EXISTED.value(), "诉求类别已存在");
			}
			
			Date now = new Date();
			type = new AppealTypeEntity(name, acceptDays, handleDays, now, now);
			typeService.save(type);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appealType/update", method = RequestMethod.POST)
	public Result update(Long appealTypeId, String name, Integer acceptDays, Integer handleDays) {
		try {
			AppealTypeEntity type = typeService.findOne(appealTypeId);
			
			AppealTypeEntity updateType = typeService.findByName(name);
			if (updateType == null || type.getId() == updateType.getId()) {
				type.setName(name);
				type.setAcceptDays(acceptDays);
				type.setHandleDays(handleDays);
				type.setUpdateTime(new Date());
				typeService.save(type);
			} else {
				return new Result(Code.EXISTED.value(), "诉求类型已存在");
			}
			
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appealType/delete")
	public Result delete(Long appealTypeId) {
		try {
			typeService.delete(appealTypeId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appealType/batchDelete")
	public Result batchDelete(@RequestParam("appealTypeIdList[]") List<Long> appealTypeIdList) {
		try {
			for (Long appealTypeId: appealTypeIdList) {
				delete(appealTypeId);
			}
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appealType/get")
	public Result get(Long appealTypeId) {
		try {
			AppealTypeEntity type = typeService.findOne(appealTypeId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", type);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value= "/api/appealType/list")
	public Result list() {
		try {
			List<AppealTypeEntity> typeList = typeService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", typeList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

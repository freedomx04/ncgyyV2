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
import com.hm.ncgyy.entity.authority.IndustryEntity;
import com.hm.ncgyy.service.authority.IndustryService;

@RestController
public class IndustryController {
	
	static Logger log = LoggerFactory.getLogger(IndustryController.class);
	
	@Autowired
	IndustryService industryService;
	
	@RequestMapping(value = "/api/industry/create", method = RequestMethod.POST)
	public Result create(String name) {
		try {
			IndustryEntity industry = industryService.findByName(name);
			if (industry != null) {
				return new Result(Code.EXISTED.value(), "行业已存在");
			}
			
			Date now = new Date();
			industry = new IndustryEntity(name, now, now);
			industryService.save(industry);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/industry/update", method = RequestMethod.POST)
	public Result update(Long industryId, String name) {
		try {
			IndustryEntity industry = industryService.findOne(industryId);
			IndustryEntity updateIndustry = industryService.findByName(name);
			if (updateIndustry == null || industry.getId() == updateIndustry.getId()) {
				industry.setName(name);
				industry.setUpdateTime(new Date());
				industryService.save(industry);
			} else {
				return new Result(Code.EXISTED.value(), "行业已存在");
			}
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/industry/delete")
	public Result delete(Long industryId) {
		try {
			industryService.delete(industryId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/industry/batchDelete")
	public Result batchDelete(@RequestParam("industryIdList[]") List<Long> industryIdList) {
		try {
			industryService.delete(industryIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/industry/get")
	public Result get(Long industryId) {
		try {
			IndustryEntity industry = industryService.findOne(industryId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", industry);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value= "/api/industry/list")
	public Result list() {
		try {
			List<IndustryEntity> industryList = industryService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", industryList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}

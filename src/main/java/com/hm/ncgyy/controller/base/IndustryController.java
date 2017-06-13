package com.hm.ncgyy.controller.base;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.service.base.IndustryService;

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
				return new Result(Code.EXISTED.value(), "existed");
			}
			
			Date now = new Date();
			industry = new IndustryEntity(name, now, now);
			industryService.save(industry);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/industry/update", method = RequestMethod.POST)
	public Result update(Long industryId) {
		try {
			IndustryEntity industry = industryService.findOne(industryId);
			industry.setUpdateTime(new Date());
			industryService.save(industry);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/industry/delete")
	public Result delete(Long industryId) {
		try {
			industryService.delete(industryId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/industry/batchDelete")
	public Result batchDelete(@RequestParam("industryIdList[]") List<Long> industryIdList) {
		try {
			for (Long industryId: industryIdList) {
				delete(industryId);
			}
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
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
	
	@RequestMapping(value = "/api/industry/exist")
	public @ResponseBody String exist(String name) throws JsonProcessingException {
		boolean result = true;

		IndustryEntity industry = industryService.findByName(name);
		if (industry != null) {
			result = false;
		}

		Map<String, Boolean> map = new HashMap<>();
		map.put("valid", result);
		ObjectMapper mapper = new ObjectMapper();
		String resultString = mapper.writeValueAsString(map);

		return resultString;
	}

}

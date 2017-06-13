package com.hm.ncgyy.controller.authority;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.base.AreaService;

@RestController
public class EnterpriseController {
	
	static Logger log = LoggerFactory.getLogger(EnterpriseController.class);
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AreaService areaService;
	
	@RequestMapping(value = "/api/enterprise/create", method = RequestMethod.POST)
	public Result create() {
		try {
			
			
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/update", method = RequestMethod.POST)
	public Result update() {
		try {
			
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/delete")
	public Result delete(Long enterpriseId) {
		try {
			
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/get")
	public Result get(Long enterpriseId) {
		try {
			
			return new ResultInfo(Code.SUCCESS.value(), "ok", null);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/list")
	public Result list() {
		try {
			
			return new ResultInfo(Code.SUCCESS.value(), "ok", null);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/listBase")
	public Result listBase() {
		try {
			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
			return new ResultInfo(Code.SUCCESS.value(), "ok", enterpriseList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/search")
	public Result search(String input) {
		try {
			
			return new ResultInfo(Code.SUCCESS.value(), "ok", null);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	

}

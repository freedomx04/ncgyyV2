package com.hm.ncgyy.controller.authority;

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
import com.hm.ncgyy.repository.authority.DepartmentEntity;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.UserService;

@RestController
public class DepartmentController {
	
	static Logger log = LoggerFactory.getLogger(DepartmentController.class);
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/api/department/create", method = RequestMethod.POST)
	public Result create(String name, String description, String principal) {
		try {
			Date now = new Date();
			DepartmentEntity department = new DepartmentEntity(name, description, principal, now, now);
			departmentService.save(department);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/department/update", method = RequestMethod.POST)
	public Result update(Long departmentId, String description, String principal) {
		try {
			DepartmentEntity department = departmentService.findOne(departmentId);
			department.setDescription(description);
			department.setPrincipal(principal);
			department.setUpdateTime(new Date());
			departmentService.save(department);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/department/delete")
	public Result delete(Long departmentId) {
		try {
			departmentService.delete(departmentId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/department/batchDelete")
	public Result batchDelete(@RequestParam("departmentIdList[]") List<Long> departmentIdList) {
		try {
			for (Long departmentId: departmentIdList) {
				delete(departmentId);
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
	
	@RequestMapping(value = "/api/department/get")
	public Result get(Long departmentId) {
		try {
			DepartmentEntity department = departmentService.findOne(departmentId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", department);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value= "/api/department/list")
	public Result list() {
		try {
			List<DepartmentEntity> departmentList = departmentService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", departmentList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/department/exist")
	public @ResponseBody String exist(String name) throws JsonProcessingException {
		boolean result = true;

		DepartmentEntity department = departmentService.findByName(name);
		if (department != null) {
			result = false;
		}

		Map<String, Boolean> map = new HashMap<>();
		map.put("valid", result);
		ObjectMapper mapper = new ObjectMapper();
		String resultString = mapper.writeValueAsString(map);

		return resultString;
	}

}

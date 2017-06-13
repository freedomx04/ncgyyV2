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
import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.service.authority.RoleService;

@RestController
public class RoleController {
	
	static Logger log = LoggerFactory.getLogger(RoleController.class);
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping(value = "/api/role/create", method = RequestMethod.POST)
	public Result create(String name, String description, String resource) {
		try {
			Date now = new Date();
			RoleEntity role = new RoleEntity(name, description, resource, now, now);
			roleService.save(role);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/role/update", method = RequestMethod.POST)
	public Result update(Long roleId, String description, String resource) {
		try {
			RoleEntity role = roleService.findOne(roleId);
			role.setDescription(description);
			role.setResource(resource);
			role.setUpdateTime(new Date());
			
			roleService.save(role);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/role/delete") 
	public Result delete(Long roleId) {
		try {
			roleService.delete(roleId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/role/batchDelete")
	public Result batchDelete(@RequestParam("roleIdList[]") List<Long> roleIdList) {
		try {
			for (Long roleId: roleIdList) {
				delete(roleId);
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
	
	@RequestMapping(value = "/api/role/get")
	public Result get(Long roleId) {
		try {
			RoleEntity role = roleService.findOne(roleId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", role);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value= "/api/role/list")
	public Result list() {
		try {
			List<RoleEntity> roleList = roleService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", roleList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/role/exist")
	public @ResponseBody String exist(String name) throws JsonProcessingException {
		boolean result = true;

		RoleEntity role = roleService.findByName(name);
		if (role != null) {
			result = false;
		}

		Map<String, Boolean> map = new HashMap<>();
		map.put("valid", result);
		ObjectMapper mapper = new ObjectMapper();
		String resultString = mapper.writeValueAsString(map);

		return resultString;
	}

}

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
import com.hm.ncgyy.entity.authority.DepartmentEntity;
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
	public Result create(String name, String principal) {
		try {
			DepartmentEntity department = departmentService.findByName(name);
			if (department != null) {
				return new Result(Code.EXISTED.value(), "部门已存在");
			}
			Date now = new Date();
			department = new DepartmentEntity(name, principal, now, now);
			departmentService.save(department);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/department/update", method = RequestMethod.POST)
	public Result update(Long departmentId, String name, String principal) {
		try {
			DepartmentEntity department = departmentService.findOne(departmentId);
			DepartmentEntity updateDepartment = departmentService.findByName(name);
			if (updateDepartment == null || department.getName() == updateDepartment.getName()) {
				department.setName(name);
				department.setPrincipal(principal);
				department.setUpdateTime(new Date());
				departmentService.save(department);
			} else {
				return new Result(Code.EXISTED.value(), "部门已存在");
			}
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/department/delete")
	public Result delete(Long departmentId) {
		try {
			departmentService.delete(departmentId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/department/batchDelete")
	public Result batchDelete(@RequestParam("departmentIdList[]") List<Long> departmentIdList) {
		try {
			departmentService.delete(departmentIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
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
	
}

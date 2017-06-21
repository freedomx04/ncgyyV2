package com.hm.ncgyy.controller.authority;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.common.utils.CiphersUtils;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.RoleService;
import com.hm.ncgyy.service.authority.UserService;

@RestController
public class UserController {

	static Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

	@Autowired
	RoleService roleService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	DepartmentService departmentService;

	@RequestMapping(value = "/api/user/create", method = RequestMethod.POST)
	public Result create(String avatar, String username, String name, Long roleId, Integer gender, String mobile,
			String email, Long enterpriseId, Long departmentId, String introduction) {
		try {
			UserEntity user = userService.findByUsername(username);
			if (user != null) {
				return new Result(Code.EXISTED.value(), "用户名已存在");
			}

			if (!mobile.isEmpty()) {
				user = userService.findByMobile(mobile);
				if (user != null) {
					return new Result(Code.EXISTED.value(), "手机号已存在");
				}
			}

			RoleEntity role = roleService.findOne(roleId);
			Date now = new Date();
			user = new UserEntity(username, name, avatar, mobile, email, gender, role, introduction, now, now);

			if (enterpriseId != null) {
				EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
				user.setEnterprise(enterprise);
			}
			if (departmentId != null) {
				DepartmentEntity department = departmentService.findOne(departmentId);
				user.setDepartment(department);
			}

			userService.save(user);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/update", method = RequestMethod.POST)
	public Result update(Long userId, String avatar, String name, Long roleId, Integer gender, String mobile,
			String email, Long enterpriseId, Long departmentId, String introduction) {
		try {
			UserEntity user = userService.findOne(userId);
			if (!mobile.isEmpty()) {
				UserEntity updateUser = userService.findByMobile(mobile);
				if (updateUser != null && updateUser.getMobile() != user.getMobile()) {
					return new Result(Code.EXISTED.value(), "手机号已存在");
				}
			}
			
			RoleEntity role = roleService.findOne(roleId);
			user.setAvatar(avatar);
			user.setName(name);
			user.setRole(role);
			user.setGender(gender);
			user.setMobile(mobile);
			user.setEmail(email);
			
			if (enterpriseId != null) {
				EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
				user.setEnterprise(enterprise);
			} else {
				user.setEnterprise(null);
			}
			
			if (departmentId != null) {
				DepartmentEntity department = departmentService.findOne(departmentId);
				user.setDepartment(department);
			} else {
				user.setDepartment(null);
			}
			
			user.setUpdateTime(new Date());
			userService.save(user);
			
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/delete")
	public Result delete(Long userId) {
		try {
			userService.delete(userId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/get")
	public Result get(Long userId) {
		try {
			UserEntity user = userService.findOne(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", user);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/list")
	public Result list() {
		try {
			List<UserEntity> userList = userService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", userList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/login", method = RequestMethod.POST)
	public Result login(String username, String password) {
		try {
			Integer method;
			String emailRegex = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			String mobileRegex = "^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$";

			// 邮箱登录
			if (username.matches(emailRegex)) {

			}
			// 手机号码登录
			else if (username.matches(mobileRegex)) {

			}
			// 用户名登录
			else {

			}

			return new Result(Code.SUCCESS.value(), "login success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	public Result logout(Long userId) {
		try {

			return new Result(Code.SUCCESS.value(), "logout success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/exist", method = RequestMethod.GET)
	public @ResponseBody String exist(String username) throws JsonProcessingException {
		boolean result = true;

		UserEntity user = userService.findByUsername(username);
		if (user != null) {
			result = false;
		}

		Map<String, Boolean> map = new HashMap<>();
		map.put("valid", result);
		ObjectMapper mapper = new ObjectMapper();
		String resultString = mapper.writeValueAsString(map);

		return resultString;
	}

	@RequestMapping(value = "/api/user/password", method = RequestMethod.POST)
	public Result password(Long userId, String oldPassword, String newPassword) {
		try {
			UserEntity user = userService.findOne(userId);
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(oldPassword), user.getPassword())) {
				return new Result(Code.USER_PWD_ERROR.value(), "password error");
			}

			user.setPassword(CiphersUtils.getInstance().MD5Password(newPassword));
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

package com.hm.ncgyy.controller.authority;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.common.utils.CiphersUtils;
import com.hm.ncgyy.common.utils.CurrentUserUtils;
import com.hm.ncgyy.common.utils.IpUtils;
import com.hm.ncgyy.common.utils.IpUtils.LocationEntity;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.LoginEntity;
import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.entity.authority.UserEntity.UserStatus;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.LoginService;
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
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	HttpServletRequest request;

	@RequestMapping(value = "/api/user/create", method = RequestMethod.POST)
	public Result create(String avatar, String username, String password, String name, Long roleId, Integer gender, String mobile,
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
			user = new UserEntity(username, CiphersUtils.getInstance().MD5Password(password), name, avatar, mobile, email, gender, role, introduction, now, now);

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
			user.setIntroduction(introduction);
			
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
	
	@RequestMapping(value = "/api/user/register", method = RequestMethod.POST)
	public Result register(String username, String password, String mobile) {
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
			
			RoleEntity role = roleService.findByName("普通用户");
			Date now = new Date();
			user = new UserEntity(username, CiphersUtils.getInstance().MD5Password(password), role, mobile, now, now);
			userService.save(user);
			
			return new ResultInfo(Code.SUCCESS.value(), "ok", user.getId());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/info", method = RequestMethod.POST)
	public Result info(Long userId, String avatar, String name, Integer gender, String email, String introduction) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setAvatar(avatar);
			user.setName(name);
			user.setGender(gender);
			user.setEmail(email);
			user.setIntroduction(introduction);
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/login", method = RequestMethod.POST)
	public Result login(String username, String password) {
		try {
			UserEntity user = userService.findByUsername(username);
			
			if (user == null) { 
				return new Result(Code.NULL.value(), "用户不存在"); 
			}
			
			if (user.getStatus() == UserStatus.STATUS_NO_VALID) { 
				return new Result(Code.USER_NO_VALID.value(), "该用户已被禁用");
			}
			
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(password), user.getPassword())) {
				return new Result(Code.USER_PWD_ERROR.value(), "密码错误");
			}

			CurrentUserUtils.getInstance().serUser(user);
			
			// 登录信息
			UserBaseEntity baseUser = userService.findOneBase(user.getId());
			//String ip = IpUtils.getIpAddr(request);
			String ip = "182.109.244.39";
			LocationEntity ipInfo = IpUtils.getIpInfo(ip);
			if (ipInfo != null) {
				String location = ipInfo.getRegion() + ipInfo.getCity() + ipInfo.getCounty();
				Date now = new Date();
				LoginEntity login = new LoginEntity(baseUser, ip, location, ipInfo.getIsp(), now, now);
				loginService.save(login);
			}
			
			return new Result(Code.SUCCESS.value(), "login success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/logout")
	public Result logout() {
		try {
			CurrentUserUtils.getInstance().removeUser();
			return new Result(Code.SUCCESS.value(), "logout success");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/password", method = RequestMethod.POST)
	public Result password(Long userId, String oldPassword, String newPassword) {
		try {
			UserEntity user = userService.findOne(userId);
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(oldPassword), user.getPassword())) {
				return new Result(Code.USER_PWD_ERROR.value(), "原密码错误");
			}

			user.setPassword(CiphersUtils.getInstance().MD5Password(newPassword));
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/password2", method = RequestMethod.POST)
	public Result password2(Long userId, String password) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setPassword(CiphersUtils.getInstance().MD5Password(password));
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/status") 
	public Result status(Long userId, Integer status) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setStatus(status);
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/infoEdit")
	public Result infoEdit(Long userId, String avatar, String name, Integer gender, String email, String introduction) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setAvatar(avatar);
			user.setName(name);
			user.setGender(gender);
			user.setEmail(email);
			user.setIntroduction(introduction);
			user.setUpdateTime(new Date());
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/exist") 
	public Result exist(String username) {
		try {
			UserBaseEntity user = userService.findByUsernameBase(username);
			if (user == null) {
				return new Result(Code.NULL.value(), "用户不存在");
			}
			
			return new ResultInfo(Code.SUCCESS.value(), "ok", user);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/validateMobile")
	public Result validateMobile(Long userId, String mobile) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			if (!user.getMobile().equals(mobile)) {
				return new Result(Code.ERROR.value(), "请输入正确的绑定手机号");
			}
			return new ResultInfo(Code.SUCCESS.value(), "ok", user);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/bind", method = RequestMethod.POST)
	public Result bind(String username, String password, String wxUserId) {
		try {
			UserEntity user = userService.findByUsername(username);
			
			if (user == null) {	
				return new Result(Code.NULL.value(), "用户不存在");
			}
			
			if (user.getStatus() == UserStatus.STATUS_NO_VALID) {
				return new Result(Code.USER_NO_VALID.value(), "用户已被禁用");
			}
			
			if (!StringUtils.equals(CiphersUtils.getInstance().MD5Password(password), user.getPassword())) {
				return new Result(Code.USER_PWD_ERROR.value(), "密码错误");
			}
			
			if (user.getWxUserId() != null) {
				return new Result(Code.USER_WX_BIND.value(), "用户已绑定微信");
			}
			
			user.setWxUserId(wxUserId);
			userService.save(user);
		
			return new ResultInfo(Code.SUCCESS.value(), "绑定成功", user);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/user/removeBind")
	public Result removeBind(Long userId) {
		try {
			UserEntity user = userService.findOne(userId);
			user.setWxUserId(null);
			userService.save(user);
			return new Result(Code.SUCCESS.value(), "解绑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
}

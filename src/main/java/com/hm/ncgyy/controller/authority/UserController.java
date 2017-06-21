package com.hm.ncgyy.controller.authority;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.common.utils.CiphersUtils;
import com.hm.ncgyy.common.utils.CommonUtils;
import com.hm.ncgyy.common.utils.FileUtil;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.LoginService;
import com.hm.ncgyy.service.authority.UserService;

@RestController
public class UserController {

	static Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

	@Value("${customize.path.upload}")
	private String uploadPath;
	
	private String avatarPath = "avatar";
	
	

	@RequestMapping(value = "/api/user/create", method = RequestMethod.POST)
	public Result create(String username, String password) {
		try {

			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/user/update", method = RequestMethod.POST)
	public Result update(Long userId) {
		try {

			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	/**
	 * 删除用户
	 * 
	 * @param userId
	 * @return
	 */
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

	/**
	 * 获取用户详情
	 * 
	 * @param userId
	 * @return
	 */
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

	/**
	 * 获取用户列表
	 * 
	 * @return
	 */
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

	/**
	 * 用户名是否存在
	 * 
	 * @param username
	 * @return
	 * @throws JsonProcessingException
	 */
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

/*	@RequestMapping(value = "/api/user/avatar", method = RequestMethod.POST)
	public Result avatar(Long userId, String base64) {
		try {
			String str = base64.substring(base64.indexOf(",") + 1);
			byte[] bytes = Base64.decodeBase64(new String(str).getBytes());
            ByteArrayInputStream in = new ByteArrayInputStream(bytes);
            
            String avatar = CommonUtils.getShortUuid();
            File file = Paths.get(uploadPath, avatarPath, avatar + ".png").toFile();
            FileUtil.sureDirExists(file, true);
            
            FileOutputStream out = new FileOutputStream(file);
            IOUtils.copy(in, out);
            
            UserEntity user = userService.findOne(userId);
            user.setAvatar(avatar);
            userService.save(user);
            
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}*/
	
	@RequestMapping(value = "/avatar/{avatar}")
	public void getAvatar(@PathVariable("avatar") String avatar, HttpServletRequest request, HttpServletResponse response) {
		FileInputStream fis = null;
		try {
			OutputStream out = response.getOutputStream();
			File file = Paths.get(uploadPath, avatarPath, avatar + ".png").toFile();
			if (!file.exists()) {
				return;
			}
			
			fis = new FileInputStream(file);
			byte[] buff = new byte[fis.available()];
			fis.read(buff);
			out.write(buff);
			out.flush();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException ioe) {
					log.error(ioe.getMessage(), ioe);
				}
			}
		}
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
	
	@Autowired
	CommonService commonService;
	
	@RequestMapping(value = "/api/user/avatar", method = RequestMethod.POST)
	public Result avatar(MultipartFile avatar_file, Object avatar_data) {
		try {
			String imagePath = null;
			if (avatar_file != null) {
				//imagePath = commonService.saveImage(avatar_file);
			}
			
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}

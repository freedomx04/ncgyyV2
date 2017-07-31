package com.hm.ncgyy.controller.authority;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.authority.LoginEntity;
import com.hm.ncgyy.service.authority.LoginService;

@RestController
public class LoginController {
	
	static Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value = "/api/login/list")
	public Result list(Long userId) {
		try {
			List<LoginEntity> loginList = loginService.listByUserId(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", loginList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/login/listPaging")
	public Result listPaging(Long userId, int page, int size) {
		try {
			Page<LoginEntity> loginPage = loginService.listByUserId(userId, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", loginPage.getContent());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

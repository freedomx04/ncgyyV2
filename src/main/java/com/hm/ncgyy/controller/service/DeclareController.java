package com.hm.ncgyy.controller.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.service.DeclareEntity;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.service.DeclareService;

@RestController
public class DeclareController {

	static Logger log = LoggerFactory.getLogger(DeclareController.class);

	@Autowired
	DeclareService declareService;

	@Autowired
	UserService userService;

	@RequestMapping(value = "/api/declare/create", method = RequestMethod.POST)
	public Result create(String title, String description, String startTime, String endTime, MultipartFile uploadFile,
			Long userId) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			Date now = new Date();
			DeclareEntity declare = new DeclareEntity(title, description, startTime, endTime, user, now, now);
			declareService.save(declare);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/declare/uploadFiles", method = RequestMethod.POST)
	public Result uploadFiles(@RequestParam("fileList")MultipartFile uploadFile) {
		try {
			
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

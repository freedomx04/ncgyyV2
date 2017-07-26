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
import com.hm.ncgyy.entity.authority.VersionEntity;
import com.hm.ncgyy.service.authority.VersionService;

@RestController
public class VersionController {
	
	static Logger log = LoggerFactory.getLogger(VersionController.class);
	
	@Autowired
	VersionService versionService;
	
	@RequestMapping(value = "/api/version/create", method = RequestMethod.POST)
	public Result create(String code, String releaseTime, String title, String content) {
		try {
			VersionEntity version = versionService.findByCode(code);
			if (version != null) {
				return new Result(Code.EXISTED.value(), "版本号已存在");
			}
			
			Date now = new Date();
			version = new VersionEntity(code, releaseTime, title, content, now, now);
			versionService.save(version);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/version/update", method = RequestMethod.POST)
	public Result update(Long versionId, String code, String releaseTime, String title, String content) {
		try {
			VersionEntity version = versionService.findOne(versionId);
			
			VersionEntity updateVersion = versionService.findByCode(code);
			if (updateVersion == null || version.getId() == updateVersion.getId()) {
				version.setCode(code);
				version.setReleaseTime(releaseTime);
				version.setTitle(title);
				version.setContent(content);
				version.setUpdateTime(new Date());
				versionService.save(version);
			} else {
				return new Result(Code.EXISTED.value(), "版本号已存在"); 
			}
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/version/delete")
	public Result delete(Long versionId) {
		try {
			versionService.delete(versionId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/version/batchDelete")
	public Result batchDelete(@RequestParam("versionIdList[]") List<Long> versionIdList) {
		try {
			versionService.delete(versionIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/version/get")
	public Result get(Long versionId) {
		try {
			VersionEntity version = versionService.findOne(versionId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", version);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/version/list")
	public Result list() {
		try {
			List<VersionEntity> versionList = versionService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", versionList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

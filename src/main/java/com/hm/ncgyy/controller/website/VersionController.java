package com.hm.ncgyy.controller.website;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.website.VersionEntity;
import com.hm.ncgyy.service.website.VersionService;

@RestController
public class VersionController {
	
	static Logger log = LoggerFactory.getLogger(VersionController.class);
	
	@Autowired
	VersionService versionService;
	
	@RequestMapping(value = "/api/website/version/create", method = RequestMethod.POST)
	public Result create(String code, String releaseTime, String content) {
		try {
			VersionEntity version = versionService.findByCode(code);
			if (version != null) {
				return new Result(Code.EXISTED.value(), "版本号已存在");
			}
			
			Date now = new Date();
			version = new VersionEntity(code, releaseTime, content, now, now);
			versionService.save(version);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/version/update", method = RequestMethod.POST)
	public Result update(Long versionId, String code, String releaseTime, String content) {
		try {
			VersionEntity version = versionService.findOne(versionId);
			
			VersionEntity updateVersion = versionService.findByCode(code);
			if (updateVersion == null || version.getId() == updateVersion.getId()) {
				version.setCode(code);
				version.setReleaseTime(releaseTime);
				version.setContent(content);
				version.setUpdateTime(new Date());
				versionService.save(version);
			} else {
				return new Result(Code.EXISTED.value(), "版本号已存在"); 
			}
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/version/delete")
	public Result delete(Long versionId) {
		try {
			versionService.delete(versionId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/version/batchDelete")
	public Result batchDelete(@RequestParam("versionIdList[]") List<Long> versionIdList) {
		try {
			versionService.delete(versionIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/version/get")
	public Result get(Long versionId) {
		try {
			VersionEntity version = versionService.findOne(versionId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", version);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/version/list")
	public Result list() {
		try {
			List<VersionEntity> versionList = versionService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", versionList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/version/listPaging")
	public Result listPaging(int page, int size) {
		try {
			Page<VersionEntity> versionPage = versionService.listPaging(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", versionPage.getContent());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/version/latest")
	public Result latest() {
		try {
			VersionEntity version = versionService.findLatest();
			return new ResultInfo(Code.SUCCESS.value(), "ok", version);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

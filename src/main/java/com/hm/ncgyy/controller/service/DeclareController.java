package com.hm.ncgyy.controller.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;
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
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.service.ApplyEntity;
import com.hm.ncgyy.entity.service.DeclareEntity;
import com.hm.ncgyy.entity.service.DeclareEntity.ApplyStatus;
import com.hm.ncgyy.entity.service.DeclareEntity.DeclareStatus;
import com.hm.ncgyy.entity.service.DeclareFileEntity;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.service.ApplyService;
import com.hm.ncgyy.service.service.DeclareFileService;
import com.hm.ncgyy.service.service.DeclareService;

@RestController
public class DeclareController {

	static Logger log = LoggerFactory.getLogger(DeclareController.class);

	@Autowired
	DeclareService declareService;
	
	@Autowired
	DeclareFileService declareFileService;

	@Autowired
	ApplyService applyService;
	
	@Autowired
	UserService userService;

	@RequestMapping(value = "/api/declare/create", method = RequestMethod.POST)
	public Result create(String title, String description, String startTime, String endTime, 
			@RequestParam("attachmentList") List<String> attachmentList, Long userId) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			Date now = new Date();
			DeclareEntity declare = new DeclareEntity(title, description, startTime, endTime, user, now, now);
			declareService.save(declare);
			
			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				DeclareFileEntity declareFile = new DeclareFileEntity(declare.getId(), filename, filepath, now, now);
				declareFileService.save(declareFile);
			}
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/declare/update", method = RequestMethod.POST)
	public Result update(Long declareId, String title, String description, String startTime, String endTime, 
			@RequestParam("attachmentList") List<String> attachmentList, Long userId) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			Date now = new Date();
			DeclareEntity declare = declareService.findOne(declareId);
			declare.setTitle(title);
			declare.setDescription(description);
			declare.setStartTime(startTime);
			declare.setEndTime(endTime);
			declare.setUser(user);
			declare.setUpdateTime(now);
			
			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				DeclareFileEntity declareFile = new DeclareFileEntity(declare.getId(), filename, filepath, now, now);
				declareFileService.save(declareFile);
			}
			declareService.save(declare);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value= "/api/declare/list")
	public Result list() {
		try {
			List<DeclareEntity> declareList = declareService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", declareList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/declare/listOnline")
	public Result listOnlineUnapply(@RequestParam Long enterpriseId) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss"); 
			
			List<DeclareEntity> list = declareService.listOnline();
			Iterator<DeclareEntity> iter = list.iterator();
			
			while(iter.hasNext()){
				DeclareEntity declare = iter.next();
				ApplyEntity apply = applyService.findOne(declare.getId(), enterpriseId);
				Date endTime = sdf.parse(declare.getEndTime());
				Date now = new Date();
				
				if (apply != null) {
					declare.setApplyStatus(ApplyStatus.APPLY);
				}
	            if (endTime.getTime() < now.getTime()) {
	            	iter.remove();
				}
	        }
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/declare/delete")
	public Result delete(Long declareId) {
		try {
			declareService.delete(declareId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/declare/batchDelete")
	public Result batchDelete(@RequestParam("declareIdList[]") List<Long> declareIdList) {
		try {
			declareService.delete(declareIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/declare/get")
	public Result get(Long declareId) {
		try {
			DeclareEntity declare = declareService.findOne(declareId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", declare);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/declare/fileDelete")
	public Result fileDelete(Long declareFileId) {
		try {
			declareFileService.delete(declareFileId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/declare/online")
	public Result online(@RequestParam Long declareId) {
		try {
			DeclareEntity declare = declareService.findOne(declareId);
			declare.setStatus(DeclareStatus.ONLINE);
			declareService.save(declare);
			return new Result(Code.SUCCESS.value(), "online");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/declare/downline")
	public Result downline(@RequestParam Long declareId) {
		try {
			DeclareEntity declare = declareService.findOne(declareId);
			declare.setStatus(DeclareStatus.DOWNLINE);
			declareService.save(declare);
			return new Result(Code.SUCCESS.value(), "downline");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
}

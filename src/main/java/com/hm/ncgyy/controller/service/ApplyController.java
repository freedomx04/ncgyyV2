package com.hm.ncgyy.controller.service;

import java.util.Date;
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
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.service.ApplyEntity;
import com.hm.ncgyy.entity.service.ApplyEntity.ApplyStatus;
import com.hm.ncgyy.entity.service.ApplyFileEntity;
import com.hm.ncgyy.entity.service.DeclareEntity;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.service.ApplyFileService;
import com.hm.ncgyy.service.service.ApplyService;
import com.hm.ncgyy.service.service.DeclareService;

@RestController
public class ApplyController {

	static Logger log = LoggerFactory.getLogger(ApplyController.class);

	@Autowired
	ApplyService applyService;

	@Autowired
	DeclareService declareService;
	
	@Autowired
	ApplyFileService applyFileService;

	@Autowired
	EnterpriseService enterpriseService;

	@RequestMapping(value = "/api/apply/add", method = RequestMethod.POST)
	public Result add(@RequestParam Long declareId, @RequestParam Long enterpriseId, @RequestParam String description,
			@RequestParam("attachmentList") List<String> attachmentList) {
		try {
			ApplyEntity apply = applyService.findOne(declareId, enterpriseId);
			if (apply != null) { // 不能重复申报
				return new Result(Code.EXISTED.value(), "已申报");
			}

			Date now = new Date();
			EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			DeclareEntity declare = declareService.findOne(declareId);
			apply = new ApplyEntity(declare, enterprise, description);
			
			apply.setCreateTime(new Date());
			apply.setStatus(ApplyStatus.UNAPPROVE);
			applyService.save(apply);
			
			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				ApplyFileEntity applyFile = new ApplyFileEntity(apply.getId(), filename, filepath, now, now);
				applyFileService.save(applyFile);
			}
			
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/apply/edit", method = RequestMethod.POST)
	public Result edit(@RequestParam Long applyId, @RequestParam String description,
			@RequestParam("attachmentList") List<String> attachmentList) {
		try {
			Date now = new Date();
			ApplyEntity apply = applyService.findOne(applyId);
			apply.setDescription(description);
			
			for (String attachment : attachmentList) {
				String filename = StringUtils.split(attachment, "?")[0];
				String filepath = StringUtils.split(attachment, "?")[1];
				ApplyFileEntity applyFile = new ApplyFileEntity(apply.getId(), filename, filepath, now, now);
				applyFileService.save(applyFile);
			}
			applyService.save(apply);
			
			return new Result(Code.SUCCESS.value(), "update");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/apply/delete")
	public Result delete(Long applyId) {
		try {
			applyService.delete(applyId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/apply/batchDelete")
	public Result batchDelete(@RequestParam("applyIdList[]") List<Long> applyIdList) {
		try {
			applyService.delete(applyIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/apply/listByEnterpriseId", method = RequestMethod.POST)
	public Result listByEnterpriseId(@RequestParam Long enterpriseId) {
		try {
			List<ApplyEntity> applyList = applyService.list(enterpriseId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", applyList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/apply/get")
	public Result get(Long applyId) {
		try {
			ApplyEntity apply = applyService.findOne(applyId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", apply);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/approve", method = RequestMethod.POST)
	public Result approve(@RequestParam Long applyId, @RequestParam Integer status,
			@RequestParam String opinion) {
		try {
			ApplyEntity apply = applyService.findOne(applyId);
			apply.setStatus(status);
			apply.setOpinion(opinion);
			applyService.save(apply);
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}
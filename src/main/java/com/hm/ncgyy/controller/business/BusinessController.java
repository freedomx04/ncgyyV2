package com.hm.ncgyy.controller.business;

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
import com.hm.ncgyy.entity.business.BusinessEntity;
import com.hm.ncgyy.service.business.BusinessService;

@RestController
public class BusinessController {

	static Logger log = LoggerFactory.getLogger(BusinessController.class);

	@Autowired
	BusinessService businessService;

	@RequestMapping(value = "/api/business/business/create", method = RequestMethod.POST)
	public Result create(String name, String address, String overview, String content, String scale, String mode,
			String contactUser, String contact, String email, String fax) {
		try {
			Date now = new Date();
			BusinessEntity business = new BusinessEntity(name, address, overview, content, scale, mode, contactUser,
					contact, email, fax, now, now);
			businessService.save(business);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/business/business/update", method = RequestMethod.POST)
	public Result update(Long businessId, String name, String address, String overview, String content, String scale,
			String mode, String contactUser, String contact, String email, String fax) {
		try {
			BusinessEntity business = businessService.findOne(businessId);
			business.setName(name);
			business.setAddress(address);
			business.setOverview(overview);
			business.setContent(content);
			business.setScale(scale);
			business.setMode(mode);
			business.setContactUser(contactUser);
			business.setContact(contact);
			business.setEmail(email);
			business.setFax(fax);
			business.setUpdateTime(new Date());
			businessService.save(business);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/business/business/delete")
	public Result delete(Long businessId) {
		try {
			businessService.delete(businessId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/business/business/deleteBatch")
	public Result deleteBatch(@RequestParam("businessIdList[]") List<Long> businessIdList) {
		try {
			businessService.delete(businessIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/business/business/get")
	public Result get(Long businessId) {
		try {
			BusinessEntity business = businessService.findOne(businessId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", business);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/business/business/list")
	public Result list() {
		try {
			List<BusinessEntity> list = businessService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/business/business/listPaging")
	public Result listPaging(int page, int size) {
		try {
			Page<BusinessEntity> list = businessService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}

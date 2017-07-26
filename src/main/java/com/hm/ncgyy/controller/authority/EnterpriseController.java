package com.hm.ncgyy.controller.authority;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.base.AreaService;
import com.hm.ncgyy.service.base.IndustryService;

@RestController
public class EnterpriseController {

	static Logger log = LoggerFactory.getLogger(EnterpriseController.class);

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	UserService userService;

	@Autowired
	AreaService areaService;

	@Autowired
	IndustryService industryService;

	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/enterprise/create", method = RequestMethod.POST)
	public Result create(String avatar, String name, Long areaId, Long industryId, String mainProduct,
			String principal, String telephone, String address, Integer pointStatus, String productionTime,
			String representative, String shareholder, String registeredCapital, String alterRecording,
			String nationalTax, String localTax, String introduction) {
		try {
			EnterpriseEntity enterprise = enterpriseService.findByName(name);
			if (enterprise != null) {
				return new Result(Code.EXISTED.value(), "企业已存在");
			}

			AreaEntity area = areaService.findOne(areaId);
			IndustryEntity industry = industryService.findOne(industryId);

			Date now = new Date();
			enterprise = new EnterpriseEntity(avatar, name, area, industry, principal, mainProduct, productionTime,
					telephone, address, representative, shareholder, registeredCapital, alterRecording, introduction,
					nationalTax, localTax, pointStatus, now, now);
			enterpriseService.save(enterprise);

			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/update", method = RequestMethod.POST)
	public Result update(Long enterpriseId, String avatar, String name, Long areaId, Long industryId, String mainProduct,
			String principal, String telephone, String address, Integer pointStatus, String productionTime,
			String representative, String shareholder, String registeredCapital, String alterRecording,
			String nationalTax, String localTax, String introduction) {
		try {
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			AreaEntity area = areaService.findOne(areaId);
			IndustryEntity industry = industryService.findOne(industryId);
			
			EnterpriseEntity updateEnterprise = enterpriseService.findByName(name);
			if (updateEnterprise != null && updateEnterprise.getName() != enterprise.getName()) {
				return new Result(Code.EXISTED.value(), "企业已存在");
			}
			
			enterprise.setName(name);
			enterprise.setAvatar(avatar);
			enterprise.setArea(area);
			enterprise.setIndustry(industry);
			enterprise.setMainProduct(mainProduct);
			enterprise.setPrincipal(principal);
			enterprise.setTelephone(telephone);
			enterprise.setAddress(address);
			enterprise.setPointStatus(pointStatus);
			enterprise.setProductionTime(productionTime);
			enterprise.setRepresentative(representative);
			enterprise.setShareholder(shareholder);
			enterprise.setRegisteredCapital(registeredCapital);
			enterprise.setAlterRecording(alterRecording);
			enterprise.setNationalTax(nationalTax);
			enterprise.setLocalTax(localTax);
			enterprise.setIntroduction(introduction);
			enterprise.setUpdateTime(new Date());
			
			enterpriseService.save(enterprise);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/delete")
	public Result delete(Long enterpriseId) {
		try {

			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/get")
	public Result get(Long enterpriseId) {
		try {

			return new ResultInfo(Code.SUCCESS.value(), "ok", null);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/list")
	public Result list() {
		try {
			List<EnterpriseEntity> enterpriseList = enterpriseService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", enterpriseList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/listBase")
	public Result listBase() {
		try {
			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
			return new ResultInfo(Code.SUCCESS.value(), "ok", enterpriseList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/listPaging")
	public Result listPaging(int page, int size) {
		try {
			Page<EnterpriseEntity> list = enterpriseService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/listPoint")
	public Result listPoint() {
		try {
			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listPoint();
			return new ResultInfo(Code.SUCCESS.value(), "ok", enterpriseList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/search")
	public Result search(String input) {
		try {
			List<EnterpriseEntity> list = enterpriseService.search(input);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

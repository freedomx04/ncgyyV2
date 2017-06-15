package com.hm.ncgyy.controller.authority;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	public Result create(String name, MultipartFile uploadImage, Long areaId, Long industryId, String mainProduct,
			String principal, String telephone, String address, Integer pointStatus, String productionTime,
			String representative, String shareholder, String registeredCapital, String alterRecording,
			String nationalTax, String localTax, String introduction) {
		try {
			EnterpriseEntity enterprise = enterpriseService.findByName(name);
			if (enterprise != null) {
				return new Result(Code.EXISTED.value(), "existed");
			}

			String imagePath = null;
			if (uploadImage != null) {
				imagePath = commonService.saveImage(uploadImage);
			}
			AreaEntity area = areaService.findOne(areaId);
			IndustryEntity industry = industryService.findOne(industryId);

			Date now = new Date();
			enterprise = new EnterpriseEntity(name, imagePath, area, industry, principal, mainProduct, productionTime,
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
	public Result update() {
		try {

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

			return new ResultInfo(Code.SUCCESS.value(), "ok", null);
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

	@RequestMapping(value = "/api/enterprise/search")
	public Result search(String input) {
		try {

			return new ResultInfo(Code.SUCCESS.value(), "ok", null);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/exist")
	public @ResponseBody String exist(String name) throws JsonProcessingException {
		boolean result = true;

		EnterpriseBaseEntity enterprise = enterpriseService.findByNameBase(name);
		if (enterprise != null) {
			result = false;
		}

		Map<String, Boolean> map = new HashMap<>();
		map.put("valid", result);
		ObjectMapper mapper = new ObjectMapper();
		String resultString = mapper.writeValueAsString(map);

		return resultString;
	}

}

package com.hm.ncgyy.controller.authority;

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
import com.hm.ncgyy.entity.authority.DemandEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.service.authority.DemandService;
import com.hm.ncgyy.service.authority.EnterpriseService;

@RestController
public class DemandController {
	
	static Logger log = LoggerFactory.getLogger(DemandController.class);
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	DemandService demandService;
	
	@RequestMapping(value = "/api/enterprise/demand/create", method = RequestMethod.POST)
	public Result create(Long enterpriseId, String title, String content) {
		try {
			EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			Date now = new Date();
			DemandEntity demand = new DemandEntity(enterprise, title, content, now, now);
			demandService.save(demand);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/demand/update", method = RequestMethod.POST)
	public Result update(Long demandId, String title, String content) {
		try {
			DemandEntity demand = demandService.findOne(demandId);
			demand.setTitle(title);
			demand.setContent(content);
			demand.setUpdateTime(new Date());
			demandService.save(demand);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/enterprise/demand/delete")
	public Result delete(Long demandId) {
		try {
			demandService.delete(demandId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/demand/deleteBatch")
	public Result deleteBatch(@RequestParam("demandIdList[]") List<Long> demandIdList) {
		try {
			demandService.delete(demandIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/demand/get")
	public Result get(Long demandId) {
		try {
			DemandEntity business = demandService.findOne(demandId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", business);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/demand/listPaging")
	public Result listPaging(int page, int size) {
		try {
			Page<DemandEntity> list = demandService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/enterprise/demand/listByEnterpriseId")
	public Result listByEnterpriseId(Long enterpriseId) {
		try {
			List<DemandEntity> list = demandService.listByEnterpriseId(enterpriseId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

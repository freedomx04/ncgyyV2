package com.hm.ncgyy.controller.service;

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
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;
import com.hm.ncgyy.entity.service.information.DemandEntity;
import com.hm.ncgyy.entity.service.information.ServiceEntity;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.service.SupplierService;
import com.hm.ncgyy.service.service.information.DemandService;
import com.hm.ncgyy.service.service.information.ServiceService;

@RestController
public class InformationController {

	static Logger log = LoggerFactory.getLogger(InformationController.class);

	@Autowired
	UserService userService;

	@Autowired
	SupplierService supplierService;

	@Autowired
	DemandService demandService;

	@Autowired
	ServiceService serviceService;

	/**
	 * 信息化服务需求
	 */
	@RequestMapping(value = "/api/service/information/demand/create", method = RequestMethod.POST)
	public Result demand_create(Long userId, String title, String content, String contactUser, String contact) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			Date now = new Date();
			DemandEntity demand = new DemandEntity(user, title, content, contactUser, contact, now, now);
			demandService.save(demand);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/demand/update", method = RequestMethod.POST)
	public Result demand_update(Long demandId, String title, String content, String contactUser, String contact) {
		try {
			DemandEntity demand = demandService.findOne(demandId);
			demand.setTitle(title);
			demand.setContent(content);
			demand.setContactUser(contactUser);
			demand.setContact(contact);
			demand.setUpdateTime(new Date());
			demandService.save(demand);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/demand/delete")
	public Result demand_delete(Long demandId) {
		try {
			demandService.delete(demandId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/demand/deleteBatch")
	public Result demand_deleteBatch(@RequestParam("demandIdList[]") List<Long> demandIdList) {
		try {
			demandService.delete(demandIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/demand/get")
	public Result demand_get(Long demandId) {
		try {
			DemandEntity demand = demandService.findOne(demandId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", demand);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/demand/listPaging", method = RequestMethod.POST)
	public Result demand_listPaging(int page, int size) {
		try {
			Page<DemandEntity> list = demandService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/demand/listByUserId")
	public Result demand_listByUserId(Long userId) {
		try {
			List<DemandEntity> list = demandService.listByUserId(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/demand/search", method = RequestMethod.POST)
	public Result demand_search(String searchStr, int page, int size) {
		try {
			Page<DemandEntity> list = demandService.search(searchStr, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	/**
	 * 信息化服务
	 */
	@RequestMapping(value = "/api/service/information/service/create", method = RequestMethod.POST)
	public Result service_create(Long supplierId, String title, String content, String contactUser, String contact) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			Date now = new Date();
			ServiceEntity service = new ServiceEntity(supplier, title, content, contactUser, contact, now, now);
			serviceService.save(service);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/service/update", method = RequestMethod.POST)
	public Result service_update(Long serviceId, String title, String content, String contactUser, String contact) {
		try {
			ServiceEntity service = serviceService.findOne(serviceId);
			service.setTitle(title);
			service.setContent(content);
			service.setContactUser(contactUser);
			service.setContact(contact);
			service.setUpdateTime(new Date());
			serviceService.save(service);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/service/delete")
	public Result service_delete(Long serviceId) {
		try {
			serviceService.delete(serviceId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/service/deleteBatch")
	public Result service_deleteBatch(@RequestParam("serviceIdList[]") List<Long> serviceIdList) {
		try {
			serviceService.delete(serviceIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/service/get")
	public Result service_get(Long serviceId) {
		try {
			ServiceEntity service = serviceService.findOne(serviceId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", service);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/service/listPaging", method = RequestMethod.POST)
	public Result service_listPaging(int page, int size) {
		try {
			Page<ServiceEntity> list = serviceService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/service/listBySupplierId")
	public Result service_listBySupplierId(Long supplierId) {
		try {
			List<ServiceEntity> list = serviceService.listBySupplierId(supplierId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/information/service/search", method = RequestMethod.POST)
	public Result service_search(String searchStr, int page, int size) {
		try {
			Page<ServiceEntity> list = serviceService.search(searchStr, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

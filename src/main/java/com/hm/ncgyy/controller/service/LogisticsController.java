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
import com.hm.ncgyy.entity.service.logistics.LineEntity;
import com.hm.ncgyy.entity.service.logistics.NetworkEntity;
import com.hm.ncgyy.entity.service.logistics.SupplyEntity;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.service.SupplierService;
import com.hm.ncgyy.service.service.logistics.LineService;
import com.hm.ncgyy.service.service.logistics.NetworkService;
import com.hm.ncgyy.service.service.logistics.SupplyService;

@RestController
public class LogisticsController {

	static Logger log = LoggerFactory.getLogger(LogisticsController.class);

	@Autowired
	SupplierService supplierService;

	@Autowired
	NetworkService networkService;

	@Autowired
	LineService lineService;

	@Autowired
	SupplyService supplyService;

	@Autowired
	UserService userService;

	/**
	 * 物流网点
	 */
	@RequestMapping(value = "/api/service/logistics/network/create", method = RequestMethod.POST)
	public Result network_create(Long supplierId, String name, String address, String contact, String business) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			Date now = new Date();
			NetworkEntity network = new NetworkEntity(supplier, name, address, contact, business, now, now);
			networkService.save(network);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/network/update", method = RequestMethod.POST)
	public Result network_update(Long networkId, String name, String address, String contact, String business) {
		try {
			NetworkEntity network = networkService.findOne(networkId);
			network.setName(name);
			network.setAddress(address);
			network.setContact(contact);
			network.setBusiness(business);
			network.setUpdateTime(new Date());
			networkService.save(network);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/network/delete")
	public Result network_delete(Long networkId) {
		try {
			networkService.delete(networkId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/network/deleteBatch")
	public Result network_deleteBatch(@RequestParam("networkIdList[]") List<Long> networkIdList) {
		try {
			networkService.delete(networkIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/network/get")
	public Result network_get(Long networkId) {
		try {
			NetworkEntity network = networkService.findOne(networkId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", network);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/network/listPaging")
	public Result network_listPaging(int page, int size) {
		try {
			Page<NetworkEntity> list = networkService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/network/listBySupplierId")
	public Result network_listBySupplierId(Long supplierId) {
		try {
			List<NetworkEntity> list = networkService.listBySupplierId(supplierId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/network/search", method = RequestMethod.POST)
	public Result network_search(String searchStr, int page, int size) {
		try {
			Page<NetworkEntity> list = networkService.search(searchStr, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	/**
	 * 物流线路
	 */
	@RequestMapping(value = "/api/service/logistics/line/create", method = RequestMethod.POST)
	public Result line_create(Long supplierId, String origin, String destination, String transportMode, String aging,
			Double heavyPrice, Double lightPrice, Double lowest) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			Date now = new Date();
			LineEntity line = new LineEntity(supplier, origin, destination, transportMode, aging, heavyPrice,
					lightPrice, lowest, now, now);
			lineService.save(line);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/line/update", method = RequestMethod.POST)
	public Result line_update(Long lineId, String origin, String destination, String transportMode, String aging,
			Double heavyPrice, Double lightPrice, Double lowest) {
		try {
			LineEntity line = lineService.findOne(lineId);
			line.setOrigin(origin);
			line.setDestination(destination);
			line.setTransportMode(transportMode);
			line.setAging(aging);
			line.setHeavyPrice(heavyPrice);
			line.setLightPrice(lightPrice);
			line.setLowest(lowest);
			line.setUpdateTime(new Date());
			lineService.save(line);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/line/delete")
	public Result line_delete(Long lineId) {
		try {
			lineService.delete(lineId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/line/deleteBatch")
	public Result line_deleteBatch(@RequestParam("lineIdList[]") List<Long> lineIdList) {
		try {
			lineService.delete(lineIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/line/get")
	public Result line_get(Long lineId) {
		try {
			LineEntity line = lineService.findOne(lineId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", line);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/line/listPaging")
	public Result line_listPaging(int page, int size) {
		try {
			Page<LineEntity> list = lineService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/line/listBySupplierId")
	public Result line_listBySupplierId(Long supplierId) {
		try {
			List<LineEntity> list = lineService.listBySupplierId(supplierId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/line/search", method = RequestMethod.POST)
	public Result line_search(String origin, String destination, int page, int size) {
		try {
			Page<LineEntity> list = lineService.search(origin, destination, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	/**
	 * 货源
	 */
	@RequestMapping(value = "/api/service/logistics/supply/create", method = RequestMethod.POST)
	public Result supply_create(Long userId, String origin, String destination, String supplyType, String description,
			String remark, String contactUser, String contact, String address) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			Date now = new Date();
			SupplyEntity supply = new SupplyEntity(user, origin, destination, supplyType, description, remark,
					contactUser, contact, address, now, now);
			supplyService.save(supply);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/supply/update", method = RequestMethod.POST)
	public Result supply_update(Long supplyId, String origin, String destination, String supplyType, String description,
			String remark, String contactUser, String contact, String address) {
		try {
			SupplyEntity supply = supplyService.findOne(supplyId);
			supply.setOrigin(origin);
			supply.setDestination(destination);
			supply.setSupplyType(supplyType);
			supply.setDescription(description);
			supply.setRemark(remark);
			supply.setContactUser(contactUser);
			supply.setContact(contact);
			supply.setAddress(address);
			supply.setUpdateTime(new Date());
			supplyService.save(supply);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/supply/delete")
	public Result supply_delete(Long supplyId) {
		try {
			supplyService.delete(supplyId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/supply/deleteBatch")
	public Result supply_deleteBatch(@RequestParam("supplyIdList[]") List<Long> supplyIdList) {
		try {
			supplyService.delete(supplyIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/supply/get")
	public Result supply_get(Long supplyId) {
		try {
			SupplyEntity supply = supplyService.findOne(supplyId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", supply);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/supply/listPaging")
	public Result supply_listPaging(int page, int size) {
		try {
			Page<SupplyEntity> list = supplyService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/supply/listByUserId")
	public Result supply_listByUserId(Long userId) {
		try {
			List<SupplyEntity> list = supplyService.listByUserId(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/logistics/supply/search", method = RequestMethod.POST)
	public Result supply_search(String origin, String destination, int page, int size) {
		try {
			Page<SupplyEntity> list = supplyService.search(origin, destination, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

package com.hm.ncgyy.controller.power;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.power.OrderEntity;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.power.OrderService;

@RestController
public class OrderController {

	static Logger log = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	OrderService orderService;

	@Autowired
	EnterpriseService enterpriseService;

	@RequestMapping(value = "/api/power/order/create", method = RequestMethod.POST)
	public Result create(String title, String content, Long enterpriseId, String contactUser, String contact) {
		try {
			EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			Date now = new Date();
			OrderEntity order = new OrderEntity(title, content, enterprise, contactUser, contact, now, now);
			orderService.save(order);

			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/power/order/update", method = RequestMethod.POST)
	public Result update(Long orderId, String title, String content, String contactUser, String contact) {
		try {
			OrderEntity order = orderService.findOne(orderId);
			order.setTitle(title);
			order.setContent(content);
			order.setContactUser(contactUser);
			order.setContact(contact);
			orderService.save(order);

			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/power/order/delete")
	public Result delete(Long orderId) {
		try {
			orderService.delete(orderId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/power/order/get")
	public Result get(Long orderId) {
		try {
			OrderEntity order = orderService.findOne(orderId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", order);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/power/order/list")
	public Result list() {
		try {
			List<OrderEntity> list = orderService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/power/order/listByEnterpriseId")
	public Result listByEnterpriseId(Long enterpriseId) {
		try {
			List<OrderEntity> list = orderService.listByEnterpriseId(enterpriseId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

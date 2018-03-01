package com.hm.ncgyy.controller.monitor;

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
import com.hm.ncgyy.common.utils.FormulaUtils;
import com.hm.ncgyy.entity.monitor.EconomicEntity;
import com.hm.ncgyy.service.monitor.EconomicService;

@RestController
public class EconomicController {
	
	static Logger log = LoggerFactory.getLogger(EconomicController.class);

	@Autowired
	EconomicService economicService;
	
	@RequestMapping(value = "/api/monitor/economic/create", method = RequestMethod.POST)
	public Result create(String monthly, Integer type, double business, double electricity, double profit, double tax) {
		try {
			EconomicEntity economic = economicService.findOne(monthly, type);
			if (economic != null) {
				return new Result(Code.EXISTED.value(), "添加失败，该月份记录已存在!");
			}
			
			Date now = new Date();
			economic = new EconomicEntity(monthly, type, business, electricity, profit, tax, now, now);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/monitor/economic/update", method = RequestMethod.POST)
	public Result update(Long economicId, double business, double electricity, double profit, double tax) {
		try {
			EconomicEntity economic = economicService.findOne(economicId);
			economic.setBusiness(business);
			economic.setElectricity(electricity);
			economic.setProfit(profit);
			economic.setTax(tax);
			economic.setUpdateTime(new Date());
			economicService.save(economic);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/monitor/economic/delete")
	public Result delete(Long economicId) {
		try {
			economicService.delete(economicId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/monitor/economic/get")
	public Result get(Long economicId) {
		try {
			EconomicEntity economic = economicService.findOne(economicId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", economic);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/monitor/economic/list")
	public Result list(Integer type) {
		try {
			List<EconomicEntity> list = economicService.list(type);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/monitor/economic/listByMonthlyRange")
	public Result listByMonthlyRange(Integer type, String monthlyStart, String monthlyEnd) {
		try {
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			List<EconomicEntity> list = economicService.listByMonthlyInAndType(monthlyList, type);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}

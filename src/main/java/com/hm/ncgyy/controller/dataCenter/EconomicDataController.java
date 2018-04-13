package com.hm.ncgyy.controller.dataCenter;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.entity.dataCenter.EconomicDataEntity;
import com.hm.ncgyy.service.dataCenter.EconomicDataService;

@RestController
public class EconomicDataController {

	static Logger log = LoggerFactory.getLogger(EconomicDataController.class);

	@Autowired
	EconomicDataService economicService;

	@RequestMapping(value = "/api/dataCenter/economic/update", method = RequestMethod.POST)
	public Result update(Integer year, Integer month, Double industry, Double business, Double investmentFund,
			Double profit, Double developmentArea, Double export) {
		try {
			Date now = new Date();
			EconomicDataEntity economic = economicService.findOne(year, month);
			if (economic == null) {
				economic = new EconomicDataEntity(year, month, now, now);
			}
			
			economic.setIndustry(industry);
			economic.setBusiness(business);
			economic.setInvestmentFund(investmentFund);
			economic.setProfit(profit);
			economic.setDevelopmentArea(developmentArea);
			economic.setExport(export);
			economic.setUpdateTime(now);
			economicService.save(economic);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

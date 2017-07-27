package com.hm.ncgyy.service.monitor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.common.utils.FormulaUtils;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.monitor.TargetEntity;
import com.hm.ncgyy.repository.monitor.TargetRepository;
import com.hm.ncgyy.service.authority.EnterpriseService;

@Service
public class TargetServiceImpl implements TargetService {

	@Autowired
	TargetRepository targetRepository;

	@Autowired
	EnterpriseService enterpriseService;

	@Override
	public TargetEntity findOne(Long targetId) {
		return targetRepository.findOne(targetId);
	}

	@Override
	public TargetEntity findOne(String monthly, Long enterpriseId) {
		return targetRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);
	}

	@Override
	public void save(TargetEntity target) {
		targetRepository.save(target);
	}

	@Override
	public void delete(Long targetId) {
		targetRepository.delete(targetId);
	}

	@Override
	public void delete(List<Long> targetIds) {
		Iterable<TargetEntity> it = targetRepository.findByIdIn(targetIds);
		targetRepository.delete(it);
	}

	@Override
	public List<TargetEntity> list(String monthly) {
		return targetRepository.findByMonthly(monthly);
	}

	@Override
	public List<TargetEntity> list(String monthly, int page, int size) {
		Page<TargetEntity> targetPage = targetRepository.findByMonthly(monthly, new PageRequest(page, size));
		return targetPage.getContent();
	}

	@Override
	public List<TargetEntity> list(Long enterpriseId) {
		return targetRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId);
	}

	@Override
	public List<TargetEntity> list(Long enterpriseId, int page, int size) {
		Page<TargetEntity> targetPage = targetRepository.findByEnterpriseIdOrderByMonthlyAsc(enterpriseId,
				new PageRequest(page, size));
		return targetPage.getContent();
	}

	@Override
	public List<TargetEntity> listByMonthlyAndEnterpriseIn(String monthly, List<EnterpriseBaseEntity> list) {
		return targetRepository.findByMonthlyAndEnterpriseIn(monthly, list);
	}

	@Override
	public List<TargetEntity> listByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId) {
		return targetRepository.findByMonthlyInAndEnterpriseId(monthlyList, enterpriseId);
	}

	public TargetEntity getLastYearTarget(TargetEntity target) {
		String monthly_lastYear = FormulaUtils.getLastYearMonthly(target.getMonthly());
		return targetRepository.findByMonthlyAndEnterpriseId(monthly_lastYear, target.getEnterprise().getId());
	}

	public TargetEntity getLastMonthTarget(TargetEntity target) {
		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(target.getMonthly());
		return targetRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth, target.getEnterprise().getId());
	}

	@Override
	public TargetVO detail(TargetEntity target) {
		TargetEntity target_lastYear = getLastYearTarget(target);
		TargetEntity target_lastMonth = getLastMonthTarget(target);
		TargetVO ret = new TargetVO(target.getMonthly(), target, target_lastYear, target_lastMonth);

		if (target_lastYear != null) {
			ret.setMainBusiness_yearGrowth(
					FormulaUtils.getGrowth(target.getMainBusiness(), target_lastYear.getMainBusiness()));
			ret.setElectricity_yearGrowth(
					FormulaUtils.getGrowth(target.getElectricity(), target_lastYear.getElectricity()));
			ret.setProfit_yearGrowth(FormulaUtils.getGrowth(target.getProfit(), target_lastYear.getProfit()));
			ret.setTax_yearGrowth(FormulaUtils.getGrowth(target.getTax(), target_lastYear.getTax()));
		}

		if (target_lastMonth != null) {
			ret.setMainBusiness_monthGrowth(
					FormulaUtils.getGrowth(target.getMainBusiness(), target_lastMonth.getMainBusiness()));
			ret.setElectricity_monthGrowth(
					FormulaUtils.getGrowth(target.getElectricity(), target_lastMonth.getElectricity()));
			ret.setProfit_monthGrowth(FormulaUtils.getGrowth(target.getProfit(), target_lastMonth.getProfit()));
			ret.setTax_monthGrowth(FormulaUtils.getGrowth(target.getTax(), target_lastMonth.getTax()));
		}

		return ret;
	}

	@Override
	public TargetVO detail(String monthly, EnterpriseBaseEntity enterprise) {
		Long enterpriseId = enterprise.getId();

		TargetEntity target = targetRepository.findByMonthlyAndEnterpriseId(monthly, enterpriseId);

		String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
		TargetEntity target_lastYear = targetRepository.findByMonthlyAndEnterpriseId(monthly_lastYear, enterpriseId);

		String monthly_lastMonth = FormulaUtils.getLastMonthMonthly(monthly);
		TargetEntity target_lastMonth = targetRepository.findByMonthlyAndEnterpriseId(monthly_lastMonth, enterpriseId);

		TargetVO ret = new TargetVO(monthly, target, target_lastYear, target_lastMonth);
		ret.setEnterprise(enterprise);

		if (target != null && target_lastYear != null) {
			ret.setMainBusiness_yearGrowth(
					FormulaUtils.getGrowth(target.getMainBusiness(), target_lastYear.getMainBusiness()));
			ret.setElectricity_yearGrowth(
					FormulaUtils.getGrowth(target.getElectricity(), target_lastYear.getElectricity()));
			ret.setProfit_yearGrowth(FormulaUtils.getGrowth(target.getProfit(), target_lastYear.getProfit()));
			ret.setTax_yearGrowth(FormulaUtils.getGrowth(target.getTax(), target_lastYear.getTax()));
		}

		if (target != null && target_lastMonth != null) {
			ret.setMainBusiness_monthGrowth(
					FormulaUtils.getGrowth(target.getMainBusiness(), target_lastMonth.getMainBusiness()));
			ret.setElectricity_monthGrowth(
					FormulaUtils.getGrowth(target.getElectricity(), target_lastMonth.getElectricity()));
			ret.setProfit_monthGrowth(FormulaUtils.getGrowth(target.getProfit(), target_lastMonth.getProfit()));
			ret.setTax_monthGrowth(FormulaUtils.getGrowth(target.getTax(), target_lastMonth.getTax()));
		}

		return ret;
	}

	@Override
	public TargetVO sumEnterpriseTarget(String monthly, List<EnterpriseBaseEntity> enterpriseList) {
		// current
		double mainBusiness_current_totle = 0;
		double electricity_current_totle = 0;
		double profit_current_totle = 0;
		double tax_current_totle = 0;
		List<TargetEntity> targetList = listByMonthlyAndEnterpriseIn(monthly, enterpriseList);
		for (TargetEntity target : targetList) {
			mainBusiness_current_totle += target.getMainBusiness();
			electricity_current_totle += target.getElectricity();
			profit_current_totle += target.getProfit();
			tax_current_totle += target.getTax();
		}
		TargetEntity target_current_totle = new TargetEntity(monthly, null,
				FormulaUtils.formatDouble(mainBusiness_current_totle),
				FormulaUtils.formatDouble(electricity_current_totle), FormulaUtils.formatDouble(profit_current_totle),
				FormulaUtils.formatDouble(tax_current_totle));

		// last year
		String lastYearMonthly = FormulaUtils.getLastYearMonthly(monthly);
		double mainBusiness_lastYear_totle = 0;
		double electricity_lastYear_totle = 0;
		double profit_lastYear_totle = 0;
		double tax_lastYear_totle = 0;
		List<TargetEntity> targetList_yearLst = listByMonthlyAndEnterpriseIn(lastYearMonthly, enterpriseList);
		for (TargetEntity target : targetList_yearLst) {
			mainBusiness_lastYear_totle += target.getMainBusiness();
			electricity_lastYear_totle += target.getElectricity();
			profit_lastYear_totle += target.getProfit();
			tax_lastYear_totle += target.getTax();
		}
		TargetEntity target_lastYear_totle = new TargetEntity(lastYearMonthly, null,
				FormulaUtils.formatDouble(mainBusiness_lastYear_totle),
				FormulaUtils.formatDouble(electricity_lastYear_totle), FormulaUtils.formatDouble(profit_lastYear_totle),
				FormulaUtils.formatDouble(tax_lastYear_totle));

		// last month
		String lastMonthMonthly = FormulaUtils.getLastMonthMonthly(monthly);
		double mainBusiness_lastMonth_totle = 0;
		double electricity_lastMonth_totle = 0;
		double profit_lastMonth_totle = 0;
		double tax_lastMonth_totle = 0;
		List<TargetEntity> targetList_lastMonth = listByMonthlyAndEnterpriseIn(lastMonthMonthly, enterpriseList);
		for (TargetEntity target : targetList_lastMonth) {
			mainBusiness_lastMonth_totle += target.getMainBusiness();
			electricity_lastMonth_totle += target.getElectricity();
			profit_lastMonth_totle += target.getProfit();
			tax_lastMonth_totle += target.getTax();
		}
		TargetEntity target_lastMonth_totle = new TargetEntity(lastMonthMonthly, null,
				FormulaUtils.formatDouble(mainBusiness_lastMonth_totle),
				FormulaUtils.formatDouble(electricity_lastMonth_totle),
				FormulaUtils.formatDouble(profit_lastMonth_totle), FormulaUtils.formatDouble(tax_lastMonth_totle));

		TargetVO ret = new TargetVO(monthly, target_current_totle, target_lastYear_totle, target_lastMonth_totle);

		// 同比
		ret.setMainBusiness_yearGrowth(FormulaUtils.getGrowth(target_current_totle.getMainBusiness(),
				target_lastYear_totle.getMainBusiness()));
		ret.setElectricity_yearGrowth(
				FormulaUtils.getGrowth(target_current_totle.getElectricity(), target_lastYear_totle.getElectricity()));
		ret.setProfit_yearGrowth(
				FormulaUtils.getGrowth(target_current_totle.getProfit(), target_lastYear_totle.getProfit()));
		ret.setTax_yearGrowth(FormulaUtils.getGrowth(target_current_totle.getTax(), target_lastYear_totle.getTax()));

		// 环比
		ret.setMainBusiness_monthGrowth(FormulaUtils.getGrowth(target_current_totle.getMainBusiness(),
				target_lastMonth_totle.getMainBusiness()));
		ret.setElectricity_monthGrowth(
				FormulaUtils.getGrowth(target_current_totle.getElectricity(), target_lastMonth_totle.getElectricity()));
		ret.setProfit_monthGrowth(
				FormulaUtils.getGrowth(target_current_totle.getProfit(), target_lastMonth_totle.getProfit()));
		ret.setTax_monthGrowth(FormulaUtils.getGrowth(target_current_totle.getTax(), target_lastMonth_totle.getTax()));

		return ret;
	}

}

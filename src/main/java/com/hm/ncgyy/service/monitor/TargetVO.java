package com.hm.ncgyy.service.monitor;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.entity.monitor.TargetEntity;

public class TargetVO {

	private String monthly; // 月份

	private AreaEntity area; // 区域

	private IndustryEntity industry; // 产业类别

	private EnterpriseBaseEntity enterprise; // 企业

	private TargetEntity target_current; // 当月指标

	private TargetEntity target_lastYear; // 去年同期指标

	private TargetEntity target_lastMonth; // 上月指标

	private String mainBusiness_yearGrowth;

	private String mainBusiness_monthGrowth;

	private String electricity_yearGrowth;

	private String electricity_monthGrowth;

	private String profit_yearGrowth;

	private String profit_monthGrowth;

	private String tax_yearGrowth;

	private String tax_monthGrowth;

	public TargetVO() {
		// TODO Auto-generated constructor stub
	}

	public TargetVO(String monthly, TargetEntity target_current, TargetEntity target_lastYear,
			TargetEntity target_lastMonth) {
		super();
		this.monthly = monthly;
		this.target_current = target_current;
		this.target_lastYear = target_lastYear;
		this.target_lastMonth = target_lastMonth;
	}

	public String getMonthly() {
		return monthly;
	}

	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}

	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
	}

	public IndustryEntity getIndustry() {
		return industry;
	}

	public void setIndustry(IndustryEntity industry) {
		this.industry = industry;
	}

	public EnterpriseBaseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseBaseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public TargetEntity getTarget_current() {
		return target_current;
	}

	public void setTarget_current(TargetEntity target_current) {
		this.target_current = target_current;
	}

	public TargetEntity getTarget_lastYear() {
		return target_lastYear;
	}

	public void setTarget_lastYear(TargetEntity target_lastYear) {
		this.target_lastYear = target_lastYear;
	}

	public TargetEntity getTarget_lastMonth() {
		return target_lastMonth;
	}

	public void setTarget_lastMonth(TargetEntity target_lastMonth) {
		this.target_lastMonth = target_lastMonth;
	}

	public String getMainBusiness_yearGrowth() {
		return mainBusiness_yearGrowth;
	}

	public void setMainBusiness_yearGrowth(String mainBusiness_yearGrowth) {
		this.mainBusiness_yearGrowth = mainBusiness_yearGrowth;
	}

	public String getMainBusiness_monthGrowth() {
		return mainBusiness_monthGrowth;
	}

	public void setMainBusiness_monthGrowth(String mainBusiness_monthGrowth) {
		this.mainBusiness_monthGrowth = mainBusiness_monthGrowth;
	}

	public String getElectricity_yearGrowth() {
		return electricity_yearGrowth;
	}

	public void setElectricity_yearGrowth(String electricity_yearGrowth) {
		this.electricity_yearGrowth = electricity_yearGrowth;
	}

	public String getElectricity_monthGrowth() {
		return electricity_monthGrowth;
	}

	public void setElectricity_monthGrowth(String electricity_monthGrowth) {
		this.electricity_monthGrowth = electricity_monthGrowth;
	}

	public String getProfit_yearGrowth() {
		return profit_yearGrowth;
	}

	public void setProfit_yearGrowth(String profit_yearGrowth) {
		this.profit_yearGrowth = profit_yearGrowth;
	}

	public String getProfit_monthGrowth() {
		return profit_monthGrowth;
	}

	public void setProfit_monthGrowth(String profit_monthGrowth) {
		this.profit_monthGrowth = profit_monthGrowth;
	}

	public String getTax_yearGrowth() {
		return tax_yearGrowth;
	}

	public void setTax_yearGrowth(String tax_yearGrowth) {
		this.tax_yearGrowth = tax_yearGrowth;
	}

	public String getTax_monthGrowth() {
		return tax_monthGrowth;
	}

	public void setTax_monthGrowth(String tax_monthGrowth) {
		this.tax_monthGrowth = tax_monthGrowth;
	}

}

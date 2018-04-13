package com.hm.ncgyy.entity.dataCenter;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "data_economic", indexes = {
	@Index(name = "index_data_economic", columnList = "year, month")
})
public class EconomicDataEntity extends BaseEntity {

	// 年份
	private Integer year;
	
	// 月份
	private Integer month;

	// 工业增加值
	private Double industry;

	// 主营业务收入
	private Double business;

	// 招商实际到位资金
	private Double investmentFund;

	// 利润总额
	private Double profit;

	// 园区实际开发面积
	private Double developmentArea;

	// 出口交货值
	private Double export;

	public EconomicDataEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public EconomicDataEntity(Integer year, Integer month) {
		super();
		this.year = year;
		this.month = month;
	}
	
	public EconomicDataEntity(Integer year, Integer month, Date createTime, Date updateTime) {
		super();
		this.year = year;
		this.month = month;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Double getIndustry() {
		return industry;
	}

	public void setIndustry(Double industry) {
		this.industry = industry;
	}

	public Double getBusiness() {
		return business;
	}

	public void setBusiness(Double business) {
		this.business = business;
	}

	public Double getInvestmentFund() {
		return investmentFund;
	}

	public void setInvestmentFund(Double investmentFund) {
		this.investmentFund = investmentFund;
	}

	public Double getProfit() {
		return profit;
	}

	public void setProfit(Double profit) {
		this.profit = profit;
	}

	public Double getDevelopmentArea() {
		return developmentArea;
	}

	public void setDevelopmentArea(Double developmentArea) {
		this.developmentArea = developmentArea;
	}

	public Double getExport() {
		return export;
	}

	public void setExport(Double export) {
		this.export = export;
	}

}

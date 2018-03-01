package com.hm.ncgyy.entity.monitor;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "monitor_economic", indexes = {
	@Index(name = "index_monitor_economic_monthly_type", columnList = "monthly, type") 
})
public class EconomicEntity extends BaseEntity {

	/** 经济类型 */
	public class EconomicType {
		public static final int TYPE_COUNTRY = 0; // 全国
		public static final int TYPE_PROVINCE = 1; // 全省
		public static final int TYPE_CITY = 2; // 全市
		public static final int TYPE_COUNTY = 3; // 全县
	}

	/** 月报表时间 */
	private String monthly;

	/** 类型 */
	private Integer type;

	/** 主营业务收入 */
	private Double business;

	/** 用电量 */
	private Double electricity;

	/** 利润总额 */
	private Double profit;

	/** 实现税金总额 */
	private Double tax;

	public EconomicEntity() {
		// TODO Auto-generated constructor stub
	}

	public EconomicEntity(String monthly, Integer type, Double business, Double electricity, Double profit, Double tax,
			Date createTime, Date updateTime) {
		super();
		this.monthly = monthly;
		this.type = type;
		this.business = business;
		this.electricity = electricity;
		this.profit = profit;
		this.tax = tax;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getMonthly() {
		return monthly;
	}

	public void setMonthly(String monthly) {
		this.monthly = monthly;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Double getBusiness() {
		return business;
	}

	public void setBusiness(Double business) {
		this.business = business;
	}

	public Double getElectricity() {
		return electricity;
	}

	public void setElectricity(Double electricity) {
		this.electricity = electricity;
	}

	public Double getProfit() {
		return profit;
	}

	public void setProfit(Double profit) {
		this.profit = profit;
	}

	public Double getTax() {
		return tax;
	}

	public void setTax(Double tax) {
		this.tax = tax;
	}

}

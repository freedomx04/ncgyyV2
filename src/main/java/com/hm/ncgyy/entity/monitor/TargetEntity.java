package com.hm.ncgyy.entity.monitor;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;

@Entity
@Table(name = "monitor_target", indexes = { @Index(name = "index_target_monthly", columnList = "monthly"),
		@Index(name = "index_target_enterprise", columnList = "enterprise_id"),
		@Index(name = "index_target_monthly_enterprise", columnList = "monthly, enterprise_id") })
public class TargetEntity extends BaseEntity {

	/**
	 * 月报表时间
	 */
	private String monthly;

	/**
	 * 关联企业
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseBaseEntity enterprise;

	/**
	 * 本月止主营业务收入
	 */
	private Double mainBusiness;

	/**
	 * 用电量
	 */
	private Double electricity;

	/**
	 * 本月止利润总额
	 */
	private Double profit;

	/**
	 * 本月止实现税金总额
	 */
	private Double tax;

	public TargetEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public TargetEntity(String monthly, EnterpriseBaseEntity enterprise, Double mainBusiness, Double electricity,
			Double profit, Double tax) {
		super();
		this.monthly = monthly;
		this.enterprise = enterprise;
		this.mainBusiness = mainBusiness;
		this.electricity = electricity;
		this.profit = profit;
		this.tax = tax;
	}

	public TargetEntity(String monthly, EnterpriseBaseEntity enterprise, Double mainBusiness, Double electricity,
			Double profit, Double tax, Date createTime, Date updateTime) {
		super();
		this.monthly = monthly;
		this.enterprise = enterprise;
		this.mainBusiness = mainBusiness;
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

	public EnterpriseBaseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseBaseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public Double getMainBusiness() {
		return mainBusiness;
	}

	public void setMainBusiness(Double mainBusiness) {
		this.mainBusiness = mainBusiness;
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

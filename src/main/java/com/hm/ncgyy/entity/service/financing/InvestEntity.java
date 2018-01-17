package com.hm.ncgyy.entity.service.financing;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;

@Entity
@Table(name = "service_financing_invest")
public class InvestEntity extends BaseEntity {

	/** 供应商 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;

	/** 投资标题 */
	private String title;

	/** 投资方式 */
	private Integer investType;

	/** 资金类型 */
	private Integer fundType;

	/** 投资行业 */
	private String profession;

	/** 投资金额 */
	private String amount;

	/** 投资项目概述 */
	@Column(length = 4000)
	private String description;

	/** 其他备注 */
	@Column(length = 2000)
	private String remark;

	public InvestEntity() {
		// TODO Auto-generated constructor stub
	}

	public InvestEntity(SupplierEntity supplier, String title, Integer investType, Integer fundType, String profession,
			String amount, String description, String remark, Date createTime, Date updateTime) {
		super();
		this.supplier = supplier;
		this.title = title;
		this.investType = investType;
		this.fundType = fundType;
		this.profession = profession;
		this.amount = amount;
		this.description = description;
		this.remark = remark;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public SupplierEntity getSupplier() {
		return supplier;
	}

	public void setSupplier(SupplierEntity supplier) {
		this.supplier = supplier;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getInvestType() {
		return investType;
	}

	public void setInvestType(Integer investType) {
		this.investType = investType;
	}

	public Integer getFundType() {
		return fundType;
	}

	public void setFundType(Integer fundType) {
		this.fundType = fundType;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}

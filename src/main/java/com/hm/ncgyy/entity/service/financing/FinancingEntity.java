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
@Table(name = "service_financing_financing")
public class FinancingEntity extends BaseEntity {

	/** 供应商 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;

	/** 融资标题 */
	private String title;

	/** 行业 */
	private Integer profession;

	/** 融资用途 */
	private String prupose;

	/** 融资金额 */
	private String amount;

	/** 融资类型 */
	private Integer financingType;

	/** 项目描述 */
	@Column(length = 4000)
	private String description;

	/** 项目优势 */
	private String advantage;

	/** 联系人 */
	private String contactUser;

	/** 联系方式 */
	private String contact;

	public FinancingEntity() {
		// TODO Auto-generated constructor stub
	}

	public FinancingEntity(SupplierEntity supplier, String title, Integer profession, String prupose, String amount,
			Integer financingType, String description, String advantage, String contactUser, String contact,
			Date createTime, Date updateTime) {
		super();
		this.supplier = supplier;
		this.title = title;
		this.profession = profession;
		this.prupose = prupose;
		this.amount = amount;
		this.financingType = financingType;
		this.description = description;
		this.advantage = advantage;
		this.contactUser = contactUser;
		this.contact = contact;
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

	public Integer getProfession() {
		return profession;
	}

	public void setProfession(Integer profession) {
		this.profession = profession;
	}

	public String getPrupose() {
		return prupose;
	}

	public void setPrupose(String prupose) {
		this.prupose = prupose;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public Integer getFinancingType() {
		return financingType;
	}

	public void setFinancingType(Integer financingType) {
		this.financingType = financingType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAdvantage() {
		return advantage;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}

	public String getContactUser() {
		return contactUser;
	}

	public void setContactUser(String contactUser) {
		this.contactUser = contactUser;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}
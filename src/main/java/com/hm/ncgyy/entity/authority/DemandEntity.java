package com.hm.ncgyy.entity.authority;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_enterprise_demand")
public class DemandEntity extends BaseEntity {

	/**
	 * 关联企业
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseBaseEntity enterprise;

	/** 需求内容 */
	@Column(length = 16777216)
	private String content;

	public DemandEntity() {
		// TODO Auto-generated constructor stub
	}

	public DemandEntity(EnterpriseBaseEntity enterprise, String content, Date createTime, Date updateTime) {
		super();
		this.enterprise = enterprise;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public EnterpriseBaseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseBaseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

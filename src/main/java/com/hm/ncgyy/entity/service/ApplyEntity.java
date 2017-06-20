package com.hm.ncgyy.entity.service;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;

@Entity
@Table(name = "service_apply")
public class ApplyEntity extends BaseEntity {
	
	public class ApplyStatus {
		public static final int NEW = 0;		// 新增
		public static final int UNAPPROVE = 1;	// 未审批
		public static final int PASS = 2;		// 审批通过
		public static final int REJECT = 3;		// 审批未通过
	}

	/**
	 * 申报
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "declare_id")
	private DeclareEntity declare;
	
	/**
	 * 申报企业
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseBaseEntity enterprise;
	
	/**
	 * 审核状态
	 */
	private Integer status = ApplyStatus.NEW;
	
	/**
	 * 审批意见
	 */
	private String opinion;
	
	/**
	 * 申请描述
	 */
	private String description;
	
	
}

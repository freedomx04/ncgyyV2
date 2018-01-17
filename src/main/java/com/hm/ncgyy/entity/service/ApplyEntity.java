package com.hm.ncgyy.entity.service;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;

@Entity
@Table(name = "service_apply")
public class ApplyEntity extends BaseEntity {
	
	public class DeclareApproveStatus {
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
	private DeclareBaseEntity declare;
	
	/**
	 * 申报企业
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseBaseEntity enterprise;
	
	/**
	 * 审核状态
	 */
	private Integer status = DeclareApproveStatus.NEW;
	
	/**
	 * 审批意见
	 */
	private String opinion;
	
	/**
	 * 申请描述
	 */
	private String description;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "apply_id")
	List<ApplyFileEntity> fileList = new LinkedList<>();

	public ApplyEntity() {
		// TODO Auto-generated constructor stub
	}

	public ApplyEntity(DeclareBaseEntity declare, EnterpriseBaseEntity enterprise, String description) {
		super();
		this.declare = declare;
		this.enterprise = enterprise;
		this.description = description;
	}

	public DeclareBaseEntity getDeclare() {
		return declare;
	}

	public void setDeclare(DeclareBaseEntity declare) {
		this.declare = declare;
	}

	public EnterpriseBaseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseBaseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<ApplyFileEntity> getFileList() {
		return fileList;
	}

	public void setFileList(List<ApplyFileEntity> fileList) {
		this.fileList = fileList;
	}
	
	
}

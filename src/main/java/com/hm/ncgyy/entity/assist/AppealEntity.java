package com.hm.ncgyy.entity.assist;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.AppealTypeEntity;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;

@Entity
@Table(name = "assist_appeal")
public class AppealEntity extends BaseEntity {
	
	/**
	 * 诉求状态
	 */
	public class AppealStatus {
		public static final int NEW = 0;		// 新增
		public static final int SENDING = 1;	// 已发送,待派发
		public static final int PENDING = 2;	// 已派发,待受理
		public static final int PROCESSING = 3;	// 已受理,处理中
		public static final int UNCONFIRM = 4;	// 已处理,待确认
		public static final int CONFIRMED = 5;	// 已确认
		public static final int REJECT = 6;		// 驳回
	}
	
	/**
	 * 企业
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseBaseEntity enterprise;
	
	/**
	 * 诉求名称
	 */
	private String title;
	
	/**
	 * 诉求类型
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "appeal_type_id")
	private AppealTypeEntity appealType;
	
	/**
	 * 诉求描述
	 */
	@Column(length = 4000)
	private String description;
	
	/**
	 * 派发部门
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "department_id")
	private DepartmentEntity department;
	
	/**
	 * 诉求状态
	 */
	private Integer status = AppealStatus.NEW;
	
	/**
	 * 发送时间
	 */
	private Date sendTime;
	
	/**
	 * 派发时间
	 */
	private Date dispatchTime;
	
	/**
	 * 受理时间
	 */
	private Date acceptTime;
	
	/**
	 * 处理时间
	 */
	private Date handleTime;
	
	/**
	 * 派发意见
	 */
	@Column(length = 2000)
	private String dispatchOpinion;
	
	/**
	 * 驳回意见
	 */
	@Column(length = 2000)
	private String rejectOpinion;
	
	/**
	 * 催办信息
	 */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "appeal_id")
	@OrderBy("createTime DESC")
	private List<UrgeEntity> urgeList = new LinkedList<>();
	
	/**
	 * 评价
	 */
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "evaluation_id")
	public EvaluationEntity evaluation; 
	
	public AppealEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public AppealEntity(EnterpriseBaseEntity enterprise, String title, AppealTypeEntity appealType, 
			String description, Date createTime, Date updateTime) {
		this.enterprise = enterprise;
		this.title = title;
		this.appealType = appealType;
		this.description = description;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public EnterpriseBaseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseBaseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public AppealTypeEntity getAppealType() {
		return appealType;
	}

	public void setAppealType(AppealTypeEntity appealType) {
		this.appealType = appealType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public DepartmentEntity getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentEntity department) {
		this.department = department;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Date getDispatchTime() {
		return dispatchTime;
	}

	public void setDispatchTime(Date dispatchTime) {
		this.dispatchTime = dispatchTime;
	}

	public Date getAcceptTime() {
		return acceptTime;
	}

	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;
	}

	public Date getHandleTime() {
		return handleTime;
	}

	public void setHandleTime(Date handleTime) {
		this.handleTime = handleTime;
	}

	public String getDispatchOpinion() {
		return dispatchOpinion;
	}

	public void setDispatchOpinion(String dispatchOpinion) {
		this.dispatchOpinion = dispatchOpinion;
	}

	public String getRejectOpinion() {
		return rejectOpinion;
	}

	public void setRejectOpinion(String rejectOpinion) {
		this.rejectOpinion = rejectOpinion;
	}

	public List<UrgeEntity> getUrgeList() {
		return urgeList;
	}

	public void setUrgeList(List<UrgeEntity> urgeList) {
		this.urgeList = urgeList;
	}

	public EvaluationEntity getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(EvaluationEntity evaluation) {
		this.evaluation = evaluation;
	}

}

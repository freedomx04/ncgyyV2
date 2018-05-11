package com.hm.ncgyy.entity.power;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;

@Entity
@Table(name = "power_order")
public class OrderEntity extends BaseEntity {
	
	/** 订单状态 */
	public class OrderStatus {
		public static final int STATUS_NEW = 0;			// 新增
		public static final int STATUS_SENDING = 1;		// 已发送，待处理
		public static final int STATUS_PROCESSING = 2;	// 已受理，处理中
		public static final int STATUS_UNCONFIRM = 3;	// 已处理，待确认
		public static final int STATUS_CONFIRMED = 4;	// 已确认
		public static final int STATUS_REJECT = 5;		// 驳回
		
	}
	
	/** 订单标题 */
	private String title;
	
	/** 订单内容 */
	@Column(length = 4000)
	private String content;
	
	/** 企业 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseBaseEntity enterprise;
	
	/** 联系人  */
	private String contactUser;
	
	/** 联系方式 */
	private String contact;
	
	/** 订单状态 */
	private Integer status;
	
	/** 评价 */
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "evaluation_id")
	public OrderEvaluationEntity evaluation;
	
	public OrderEntity() {
		// TODO Auto-generated constructor stub
	}

	public OrderEntity(String title, String content, EnterpriseBaseEntity enterprise, String contactUser,
			String contact, Date createTime, Date updateTime) {
		super();
		this.title = title;
		this.content = content;
		this.enterprise = enterprise;
		this.contactUser = contactUser;
		this.contact = contact;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public EnterpriseBaseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseBaseEntity enterprise) {
		this.enterprise = enterprise;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public OrderEvaluationEntity getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(OrderEvaluationEntity evaluation) {
		this.evaluation = evaluation;
	}
	
}

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
		public static final int STATUS_NEW = 0;			// 待发送
		public static final int STATUS_SENDING = 1;		// 待处理
		public static final int STATUS_UNCONFIRM = 2;	// 已处理
		public static final int STATUS_CONFIRMED = 3;	// 已评价
		public static final int STATUS_REJECT = 4;		// 已驳回
		
	}
	
	/** 企业 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseBaseEntity enterprise;
	
	/** 订单标题 */
	private String title;
	
	/** 订单内容 */
	@Column(length = 4000)
	private String content;
	
	/** 联系人  */
	private String contactUser;
	
	/** 联系方式 */
	private String contact;
	
	/** 订单状态 */
	private Integer status = OrderStatus.STATUS_NEW;
	
	/** 服务评价 */
	private Integer result = 5;
	
	/** 评价内容 */
	@Column(length = 2000)
	private String evaluate;
	
	public OrderEntity() {
		// TODO Auto-generated constructor stub
	}

	public OrderEntity(EnterpriseBaseEntity enterprise, String title, String content, String contactUser,
			String contact, Date createTime, Date updateTime) {
		super();
		this.enterprise = enterprise;
		this.title = title;
		this.content = content;
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

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

}

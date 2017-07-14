package com.hm.ncgyy.entity.office;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "office_send")
public class SendEntity extends BaseEntity {
	
	public class SendStatus {
		public static final int NEW = 0;	// 新增
		public static final int DRAFT = 1;	// 草稿
		public static final int SEND = 2;	// 已发送
	}
	
	/**
	 * 邮件内容
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "email_id")
    private EmailEntity email; 
	
	/**
	 * 发件人
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "sender_id")
    private UserBaseEntity sender; 
	
	/**
	 * 收件人（多个,以','隔开）
	 */
	private String receivers;
	
	/**
	 * 发件状态
	 */
	private Integer sendStatus = SendStatus.NEW;
	
	/**
	 * 发送时间
	 */
	private Date sendTime;
	
	public SendEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SendEntity(EmailEntity email, UserBaseEntity sender, String receivers, Integer sendStatus, Date sendTime, Date createTime, Date updateTime) {
		super();
		this.email = email;
		this.sender = sender;
		this.receivers = receivers;
		this.sendStatus = sendStatus;
		this.sendTime = sendTime;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public EmailEntity getEmail() {
		return email;
	}

	public void setEmail(EmailEntity email) {
		this.email = email;
	}

	public UserBaseEntity getSender() {
		return sender;
	}

	public void setSender(UserBaseEntity sender) {
		this.sender = sender;
	}

	public String getReceivers() {
		return receivers;
	}

	public void setReceivers(String receivers) {
		this.receivers = receivers;
	}

	public Integer getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(Integer sendStatus) {
		this.sendStatus = sendStatus;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	
}

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
@Table(name = "office_receive")
public class ReceiveEntity extends BaseEntity {
	
	public class PointStatus {
        public static final int UNPOINT = 0; 	// 非重点
        public static final int POINT = 1; 		// 重点
    }
	
	public class ReadStatus {
		public static final int UNREAD = 0;		// 未读
		public static final int READ = 1;		// 已读
	}
	
	public class DeleteStatus {
		public static final int NOT_DELETE = 0;	// 未删除
		public static final int DELETED = 1;	// 已删除
	}
	
	/**
	 * 邮件内容
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "email_id")
    private EmailEntity email; 
	
	/**
	 * 收件人
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "receive_id")
    private UserBaseEntity receiver; 
	
	/**
	 * 发件人
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "sender_id")
    private UserBaseEntity sender; 
	
	/**
	 * 发送时间
	 */
	private Date sendTime;
	
	/**
	 * 重点状态
	 */
	private Integer pointStatus = PointStatus.UNPOINT;
	
	/**
	 * 已读状态
	 */
	private Integer readStatus = ReadStatus.UNREAD;
	
	/**
	 * 删除状态
	 */
	private Integer deleteStatus = DeleteStatus.NOT_DELETE;
	
	public ReceiveEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReceiveEntity(EmailEntity email, UserBaseEntity receiver, UserBaseEntity sender, Date sendTime, Date createTime, Date updateTime) {
		super();
		this.email = email;
		this.receiver = receiver;
		this.sender = sender;
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

	public UserBaseEntity getReceiver() {
		return receiver;
	}

	public void setReceiver(UserBaseEntity receiver) {
		this.receiver = receiver;
	}

	public UserBaseEntity getSender() {
		return sender;
	}

	public void setSender(UserBaseEntity sender) {
		this.sender = sender;
	}
	
	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Integer getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(Integer pointStatus) {
		this.pointStatus = pointStatus;
	}

	public Integer getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(Integer readStatus) {
		this.readStatus = readStatus;
	}

	public Integer getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	
}

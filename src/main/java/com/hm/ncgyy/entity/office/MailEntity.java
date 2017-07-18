package com.hm.ncgyy.entity.office;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "office_mail")
public class MailEntity extends BaseEntity {
	
	public class MailStatus {
		public static final int NEW = 0;	// 新增
		public static final int DRAFT = 1;	// 草稿
		public static final int SEND = 2;	// 已发送
		public static final int RECEIVE = 3;// 收件
	}
	
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
	 * 收件人（多个,以','隔开）
	 */
	private String receivers;
	
	/**
	 * 邮件标题
	 */
	private String title;
	
	/**
	 * 邮件内容路径
	 */
	private String path;
	
	/**
	 * 邮件内容
	 */
	private String content;
	
	/**
	 * 附件
	 */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "mail_id")
	private List<MailFileEntity> fileList = new LinkedList<>();
	
	/**
	 * 发件人
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "sender_id")
    private UserBaseEntity sender;
	
	/**
	 * 收件人
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "receive_id")
    private UserBaseEntity receiver; 
	
	/**
	 * 邮件状态
	 */
	private Integer mailStatus = MailStatus.NEW;
	
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
	
	public MailEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MailEntity(String receivers, String title, String path, UserBaseEntity sender, Date createTime, Date updateTime) {
		super();
		this.receivers = receivers;
		this.title = title;
		this.path = path;
		this.sender = sender;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}
	
	

	public MailEntity(String receivers, String title, String path, List<MailFileEntity> fileList, UserBaseEntity sender,
			UserBaseEntity receiver, Date sendTime, Date createTime, Date updateTime) {
		super();
		this.receivers = receivers;
		this.title = title;
		this.path = path;
		this.fileList = fileList;
		this.sender = sender;
		this.receiver = receiver;
		this.sendTime = sendTime;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getReceivers() {
		return receivers;
	}

	public void setReceivers(String receivers) {
		this.receivers = receivers;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<MailFileEntity> getFileList() {
		return fileList;
	}

	public void setFileList(List<MailFileEntity> fileList) {
		this.fileList = fileList;
	}

	public UserBaseEntity getSender() {
		return sender;
	}

	public void setSender(UserBaseEntity sender) {
		this.sender = sender;
	}

	public UserBaseEntity getReceiver() {
		return receiver;
	}

	public void setReceiver(UserBaseEntity receiver) {
		this.receiver = receiver;
	}

	public Integer getMailStatus() {
		return mailStatus;
	}

	public void setMailStatus(Integer mailStatus) {
		this.mailStatus = mailStatus;
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

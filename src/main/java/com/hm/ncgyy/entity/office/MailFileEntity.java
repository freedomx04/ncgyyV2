package com.hm.ncgyy.entity.office;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "office_mail_file")
public class MailFileEntity extends BaseEntity {
	
	/**
	 * 关联邮件
	 */
	@Column(name = "mail_id")
	private Long mailId;
	
	/**
	 * 文件名称
	 */
	private String filename;
	
	/**
	 * 文件路径
	 */
	private String filepath;
	
	/**
	 * 文件图标
	 */
	private String fileIcon;
	
	public MailFileEntity() {
		// TODO Auto-generated constructor stub
	}

	public MailFileEntity(Long mailId, String filename, String filepath, String fileIcon, Date createTime, Date updateTime) {
		super();
		this.mailId = mailId;
		this.filename = filename;
		this.filepath = filepath;
		this.fileIcon = fileIcon;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getMailId() {
		return mailId;
	}

	public void setMailId(Long mailId) {
		this.mailId = mailId;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getFileIcon() {
		return fileIcon;
	}

	public void setFileIcon(String fileIcon) {
		this.fileIcon = fileIcon;
	}
	
}

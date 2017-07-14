package com.hm.ncgyy.entity.office;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "office_email_file")
public class EmailFileEntity extends BaseEntity {
	
	/**
	 * 关联邮件
	 */
	@Column(name = "email_id")
	private Long emailId;
	
	/**
	 * 文件名称
	 */
	private String filename;
	
	/**
	 * 文件路径
	 */
	private String filepath;
	
	public EmailFileEntity() {
		// TODO Auto-generated constructor stub
	}

	public EmailFileEntity(Long emailId, String filename, String filepath, Date createTime, Date updateTime) {
		super();
		this.emailId = emailId;
		this.filename = filename;
		this.filepath = filepath;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getEmailId() {
		return emailId;
	}

	public void setEmailId(Long emailId) {
		this.emailId = emailId;
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
	
}

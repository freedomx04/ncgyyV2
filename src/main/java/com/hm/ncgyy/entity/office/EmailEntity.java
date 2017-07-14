package com.hm.ncgyy.entity.office;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "office_email")
public class EmailEntity extends BaseEntity {
	
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
	@JoinColumn(name = "email_id")
	private List<EmailFileEntity> fileList = new LinkedList<>();
	
	public EmailEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmailEntity(String title, String path, Date createTime, Date updateTime) {
		super();
		this.title = title;
		this.path = path;
		this.createTime = createTime;
		this.updateTime = updateTime;
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

	public List<EmailFileEntity> getFileList() {
		return fileList;
	}

	public void setFileList(List<EmailFileEntity> fileList) {
		this.fileList = fileList;
	}

}

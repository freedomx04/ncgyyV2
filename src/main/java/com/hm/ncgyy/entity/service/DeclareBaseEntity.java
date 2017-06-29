package com.hm.ncgyy.entity.service;

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
import com.hm.ncgyy.entity.service.DeclareEntity.DeclareStatus;

@Entity
@Table(name = "service_declare")
public class DeclareBaseEntity extends BaseEntity {
	
	private String title; // 申报项目名称

	private String description; // 申报简介

	private Date startTime; // 申报开始时间

	private Date endTime; // 申报结束时间

	private Integer status = DeclareStatus.NEW; // 申报状态

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "declare_id")
	List<DeclareFileEntity> fileList = new LinkedList<>();
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user; // 发布人
	
	public DeclareBaseEntity() {
		// TODO Auto-generated constructor stub
	}


	
	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public List<DeclareFileEntity> getFileList() {
		return fileList;
	}



	public void setFileList(List<DeclareFileEntity> fileList) {
		this.fileList = fileList;
	}



	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
	}
	
}
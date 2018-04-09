package com.hm.ncgyy.entity.website;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_project")
public class ProjectEntity extends BaseEntity {
	
	// 工程名称
	private String name;
	
	// 工程概述
	@Column(length = 4000)
	private String description;
	
	// 工程进度
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "project_id")
	private List<ProjectProgressEntity> progressList = new LinkedList<>();
	
	public ProjectEntity() {
		// TODO Auto-generated constructor stub
	}

	public ProjectEntity(String name, String description, Date createTime, Date updateTime) {
		super();
		this.name = name;
		this.description = description;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<ProjectProgressEntity> getProgressList() {
		return progressList;
	}

	public void setProgressList(List<ProjectProgressEntity> progressList) {
		this.progressList = progressList;
	}

}

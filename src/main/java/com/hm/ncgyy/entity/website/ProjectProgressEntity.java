package com.hm.ncgyy.entity.website;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_project_progress", indexes = {
	@Index(name = "index_website_project_progress_projectId", columnList = "project_id, updateTime")
})
public class ProjectProgressEntity extends BaseEntity {
	
	// 关联工程
	@Column(name = "project_id")
	private Long projectId;
	
	// 进度名称
	private String name;
	
	public ProjectProgressEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProjectProgressEntity(Long projectId, String name, Date createTime, Date updateTime) {
		super();
		this.projectId = projectId;
		this.name = name;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}

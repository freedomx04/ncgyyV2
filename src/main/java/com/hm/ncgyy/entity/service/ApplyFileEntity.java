package com.hm.ncgyy.entity.service;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "service_apply_file")
public class ApplyFileEntity extends BaseEntity {
	
	/**
	 * 申报项目
	 */
	@Column(name = "apply_id")
	private Long applyId;
	
	/**
	 * 申报文件名称
	 */
	private String filename;
	
	/**
	 * 申报文件路径
	 */
	private String filepath;
	
	public ApplyFileEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public ApplyFileEntity(Long applyId, String filename, String filepath, Date createTime, Date updateTime) {
		super();
		this.applyId = applyId;
		this.filename = filename;
		this.filepath = filepath;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}


	public Long getApplyId() {
		return applyId;
	}

	public void setApplyId(Long applyId) {
		this.applyId = applyId;
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

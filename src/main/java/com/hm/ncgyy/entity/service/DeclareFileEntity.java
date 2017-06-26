package com.hm.ncgyy.entity.service;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "service_declare_file")
public class DeclareFileEntity extends BaseEntity {
	
	/**
	 * 申报项目
	 */
	@Column(name = "declare_id")
	private Long declareId;
	
	/**
	 * 申报文件名称
	 */
	private String filename;
	
	/**
	 * 申报文件路径
	 */
	private String filepath;
	
	public DeclareFileEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public DeclareFileEntity(Long declareId, String filename, String filepath, Date createTime, Date updateTime) {
		super();
		this.declareId = declareId;
		this.filename = filename;
		this.filepath = filepath;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getDeclareId() {
		return declareId;
	}

	public void setDeclareId(Long declareId) {
		this.declareId = declareId;
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

package com.hm.ncgyy.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "base_area")
public class AreaEntity extends BaseEntity {
	
	/**
	 * 区域名称
	 */
	@Column(unique = true)
	private String name;
	
	/**
	 * 区域描述
	 */
	private String description;
	
	public AreaEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param name
	 * @param description
	 */
	public AreaEntity(String name, String description, Date createTime, Date updateTime) {
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
	
}

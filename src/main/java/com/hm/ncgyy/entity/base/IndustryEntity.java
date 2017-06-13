package com.hm.ncgyy.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "base_industry")
public class IndustryEntity extends BaseEntity {
	
	/**
	 * 行业名称
	 */
	@Column(unique = true)
	private String name;
	
	public IndustryEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public IndustryEntity(String name, Date createTime, Date updateTime) {
		super();
		this.name = name;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}

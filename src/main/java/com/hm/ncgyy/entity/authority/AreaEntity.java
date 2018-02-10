package com.hm.ncgyy.entity.authority;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "base_area")
public class AreaEntity extends BaseEntity {

	/** 园区名称 */
	@Column(unique = true)
	private String name;

	public AreaEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AreaEntity(String name, Date createTime, Date updateTime) {
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

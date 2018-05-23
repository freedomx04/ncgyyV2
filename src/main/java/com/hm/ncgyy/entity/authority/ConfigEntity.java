package com.hm.ncgyy.entity.authority;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authority_config")
public class ConfigEntity {

	/** 配置名称 */
	@Id
	private String name = "config";
	
	public ConfigEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}

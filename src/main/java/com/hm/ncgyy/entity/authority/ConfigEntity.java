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
	
	/** 电力服务-服务热线 */
	private String power_hotline;
	
	/** 电力服务-投诉举报点好*/
	private String power_report;

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

	public String getPower_hotline() {
		return power_hotline;
	}

	public void setPower_hotline(String power_hotline) {
		this.power_hotline = power_hotline;
	}

	public String getPower_report() {
		return power_report;
	}

	public void setPower_report(String power_report) {
		this.power_report = power_report;
	}
	
}

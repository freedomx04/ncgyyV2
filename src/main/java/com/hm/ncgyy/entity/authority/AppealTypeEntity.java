package com.hm.ncgyy.entity.authority;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "base_appeal_type")
public class AppealTypeEntity extends BaseEntity {

	/** 诉求类型名称 */
	@Column(unique = true)
	private String name;

	/** 最大受理天数 */
	private Integer acceptDays;

	/** 最大处理天数 */
	private Integer handleDays;

	public AppealTypeEntity() {
		// TODO Auto-generated constructor stub
	}

	public AppealTypeEntity(String name, Integer acceptDays, Integer handleDays, Date createTime, Date updateTime) {
		this.name = name;
		this.acceptDays = acceptDays;
		this.handleDays = handleDays;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAcceptDays() {
		return acceptDays;
	}

	public void setAcceptDays(Integer acceptDays) {
		this.acceptDays = acceptDays;
	}

	public Integer getHandleDays() {
		return handleDays;
	}

	public void setHandleDays(Integer handleDays) {
		this.handleDays = handleDays;
	}

}

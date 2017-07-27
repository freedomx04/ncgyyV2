package com.hm.ncgyy.entity.authority;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_version")
public class VersionEntity extends BaseEntity {
	
	/**
	 * 版本号
	 */
	private String code;
	
	/**
	 * 发布时间
	 */
	private String releaseTime;
	
	/**
	 * 版本内容
	 */
	@Column(length = 4000)
	private String content;
	
	public VersionEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public VersionEntity(String code, String releaseTime, String content, Date createTime, Date updateTime) {
		super();
		this.code = code;
		this.releaseTime = releaseTime;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getReleaseTime() {
		return releaseTime;
	}

	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

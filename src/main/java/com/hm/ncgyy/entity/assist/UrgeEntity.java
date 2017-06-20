package com.hm.ncgyy.entity.assist;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "assist_urge")
public class UrgeEntity extends BaseEntity {
	
	@Column(name = "appeal_id")
	private Long appealId;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user;
	
	@Column(length = 2000)
	private String content;
	
	public UrgeEntity() {
		// TODO Auto-generated constructor stub
	}

	public UrgeEntity(Long appealId, UserBaseEntity user, String content, Date createTime, Date updateTime) {
		super();
		this.appealId = appealId;
		this.user = user;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getAppealId() {
		return appealId;
	}

	public void setAppealId(Long appealId) {
		this.appealId = appealId;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

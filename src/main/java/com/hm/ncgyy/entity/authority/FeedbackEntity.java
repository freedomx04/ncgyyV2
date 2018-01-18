package com.hm.ncgyy.entity.authority;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_feedback")
public class FeedbackEntity extends BaseEntity {
	
	/** 反馈用户 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "user_id")
	private UserBaseEntity user;
	
	/** 反馈内容 */
	@Column(length = 4000)
	private String content;
	
	public FeedbackEntity() {
		// TODO Auto-generated constructor stub
	}

	public FeedbackEntity(UserBaseEntity user, String content, Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
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

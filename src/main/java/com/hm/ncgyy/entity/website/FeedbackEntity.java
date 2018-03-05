package com.hm.ncgyy.entity.website;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_feedback")
public class FeedbackEntity extends BaseEntity {
	
	/** 反馈内容 */
	@Column(length = 4000)
	private String content;
	
	public FeedbackEntity() {
		// TODO Auto-generated constructor stub
	}

	public FeedbackEntity(String content, Date createTime, Date updateTime) {
		super();
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}

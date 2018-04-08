package com.hm.ncgyy.entity.website;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "webiste_parallel_approve", indexes = {
	@Index(name = "index_website_parallel", columnList = "updateTime")
})
public class ParallelApproveEntity extends BaseEntity {

	// 并联审批标题
	private String title;
	
	// 并联审批链接
	private String link;
	
	public ParallelApproveEntity() {
		// TODO Auto-generated constructor stub
	}

	public ParallelApproveEntity(String title, String link, Date createTime, Date updateTime) {
		super();
		this.title = title;
		this.link = link;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
}

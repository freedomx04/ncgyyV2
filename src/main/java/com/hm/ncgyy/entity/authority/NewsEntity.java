package com.hm.ncgyy.entity.authority;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_enterprise_news", indexes = {
	@Index(name = "index_authority_enterprise_news", columnList = "enterprise_id, updateTime") 	
})
public class NewsEntity extends BaseEntity {

	/** 关联企业 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseBaseEntity enterprise;

	/** 新闻标题 */
	private String title;

	/** 新闻内容 */
	@Column(length = 16777216)
	private String content;

	public NewsEntity() {
		// TODO Auto-generated constructor stub
	}

	public NewsEntity(EnterpriseBaseEntity enterprise, String title, String content, Date createTime, Date updateTime) {
		super();
		this.enterprise = enterprise;
		this.title = title;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public EnterpriseBaseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseBaseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

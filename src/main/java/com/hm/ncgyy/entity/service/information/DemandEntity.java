package com.hm.ncgyy.entity.service.information;

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
@Table(name = "service_information_demand")
public class DemandEntity extends BaseEntity {

	/** 用户 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user;

	/** 需求标题 */
	private String title;

	/** 需求内容 */
	@Column(length = 16777216)
	private String content;

	/** 联系人 */
	private String contactUser;

	/** 联系电话 */
	private String contact;

	public DemandEntity() {
		// TODO Auto-generated constructor stub
	}

	public DemandEntity(UserBaseEntity user, String title, String content, String contactUser, String contact,
			Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.title = title;
		this.content = content;
		this.contactUser = contactUser;
		this.contact = contact;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
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

	public String getContactUser() {
		return contactUser;
	}

	public void setContactUser(String contactUser) {
		this.contactUser = contactUser;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}

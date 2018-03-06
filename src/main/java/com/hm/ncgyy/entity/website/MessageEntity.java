package com.hm.ncgyy.entity.website;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_business_message")
public class MessageEntity extends BaseEntity {

	/** 姓名 */
	private String name;

	/** 联系电话 */
	private String contact;

	/** 地区 */
	private String area;

	/** 邮箱 */
	private String email;

	/** qq */
	private String qq;

	/** 留言 */
	@Column(length = 16777216)
	private String content;

	public MessageEntity() {
		// TODO Auto-generated constructor stub
	}

	public MessageEntity(String name, String contact, String area, String email, String qq, String content,
			Date createTime, Date updateTime) {
		super();
		this.name = name;
		this.contact = contact;
		this.area = area;
		this.email = email;
		this.qq = qq;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

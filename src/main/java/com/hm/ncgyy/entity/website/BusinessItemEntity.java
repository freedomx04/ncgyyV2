package com.hm.ncgyy.entity.website;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_business_item")
public class BusinessItemEntity extends BaseEntity {

	/** 项目名称 */
	private String name;

	/** 项目地点 */
	private String address;

	/** 项目概况 */
	@Column(length = 4000)
	private String overview;

	/** 建设内容 */
	private String content;

	/** 投资规模 */
	private String scale;

	/** 合作方式 */
	private String mode;

	/** 联系人 */
	private String contactUser;

	/** 联系电话 */
	private String contact;

	/** 邮箱 */
	private String email;
	
	/** 传真 */
	private String fax;
	
	public BusinessItemEntity() {
		// TODO Auto-generated constructor stub
	}

	public BusinessItemEntity(String name, String address, String overview, String content, String scale, String mode,
			String contactUser, String contact, String email, String fax, Date createTime, Date updateTime) {
		super();
		this.name = name;
		this.address = address;
		this.overview = overview;
		this.content = content;
		this.scale = scale;
		this.mode = mode;
		this.contactUser = contactUser;
		this.contact = contact;
		this.email = email;
		this.fax = fax;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

}

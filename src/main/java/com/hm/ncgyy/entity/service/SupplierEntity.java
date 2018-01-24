package com.hm.ncgyy.entity.service;

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
@Table(name = "service_supplier")
public class SupplierEntity extends BaseEntity {

	/** 认证状态 */
	public class SupplierStatus {
		public static final int STATUS_NEW = 1; // 待审核
		public static final int STATUS_PASS = 2; // 已通过
		public static final int STATUS_DENY = 3; // 未通过
	}

	/** 供应商类型 */
	public class SupplierType {
		public static final int TYPE_TALENT = 1; // 人才供应商
		public static final int TYPE_BUSINESS = 2; // 招商供应商
		public static final int TYPE_FINANCING = 3; // 融资供应商
		public static final int TYPE_LOGISITCS = 4; // 物流供应商
	}

	/** 用户 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user;

	/** 供应商类型 */
	private Integer type;

	/** 供应商名称 */
	private String name;

	/** 图片 */
	private String imagePath;

	/** 行业类别 */
	private String profession;

	/** 性质 */
	private String property;

	/** 规模 */
	private String scale;

	/** 地址 */
	private String address;

	/** 座机 */
	private String phone;

	/** 传真 */
	private String fax;

	/** 联系人 */
	private String contactUser;

	/** 联系电话 */
	private String contact;

	/** 简介 */
	@Column(length = 2000)
	private String introduction;

	/**
	 * 审批
	 */
	/** 营业执照 */
	private String license;

	/** 营业执照图片地址 */
	private String licensePath;

	/** 认证状态 */
	private Integer status = SupplierStatus.STATUS_NEW;

	public SupplierEntity() {
		// TODO Auto-generated constructor stub
	}

	public SupplierEntity(UserBaseEntity user, Integer type, String name, String imagePath, String profession,
			String property, String scale, String address, String phone, String fax, String contactUser, String contact,
			String introduction, String license, String licensePath, Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.type = type;
		this.name = name;
		this.imagePath = imagePath;
		this.profession = profession;
		this.property = property;
		this.scale = scale;
		this.address = address;
		this.phone = phone;
		this.fax = fax;
		this.contactUser = contactUser;
		this.contact = contact;
		this.introduction = introduction;
		this.license = license;
		this.licensePath = licensePath;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
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

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getLicensePath() {
		return licensePath;
	}

	public void setLicensePath(String licensePath) {
		this.licensePath = licensePath;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}

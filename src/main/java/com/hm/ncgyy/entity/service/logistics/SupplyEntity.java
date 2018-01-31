package com.hm.ncgyy.entity.service.logistics;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "service_logistics_supply", indexes = {
	@Index(name = "index_service_logistics_supply_updateTime", columnList = "updateTime"),
	@Index(name = "index_service_logistics_supply_user", columnList = "user_id, updateTime"),
	@Index(name = "index_service_logistics_supply_search", columnList = "origin, destination, updateTime")
})
public class SupplyEntity extends BaseEntity {

	/** 用户 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user;

	/** 发货地 */
	private String origin;

	/** 收货地 */
	private String destination;

	/** 货源类型 */
	private String supplyType;

	/** 货源描述 */
	@Column(length = 4000)
	private String description;

	/** 备注 */
	@Column(length = 2000)
	private String remark;

	/** 联系人 */
	private String contactUser;

	/** 联系电话 */
	private String contact;

	/** 具体地点 */
	private String address;

	public SupplyEntity() {
		// TODO Auto-generated constructor stub
	}

	public SupplyEntity(UserBaseEntity user, String origin, String destination, String supplyType, String description,
			String remark, String contactUser, String contact, String address, Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.origin = origin;
		this.destination = destination;
		this.supplyType = supplyType;
		this.description = description;
		this.remark = remark;
		this.contactUser = contactUser;
		this.contact = contact;
		this.address = address;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSupplyType() {
		return supplyType;
	}

	public void setSupplyType(String supplyType) {
		this.supplyType = supplyType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}

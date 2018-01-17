package com.hm.ncgyy.entity.service.logistics;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "service_logistics_supply")
public class LogisticsSupplyEntity extends BaseEntity {

	/** 货源分类 */
	public class SupplyType {
		public static final int SUPPLY_HEAVY = 0; // 重货
		public static final int SUPPLY_LIGHT = 1; // 轻货
	}

	/** 用户 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user;

	/** 发货地 */
	private String origin;

	/** 收货地 */
	private String destination;

	/** 货源描述 */
	private String description;

	/** 货源类型 */
	private Integer supplyType;

	/** 有效时间 */
	private Date validDate;

	/** 备注 */
	private String remark;

	/** 联系人 */
	private String contactUser;

	/** 联系电话 */
	private String contact;

	/** 具体地点 */
	private String address;

	public LogisticsSupplyEntity() {
		// TODO Auto-generated constructor stub
	}

	public LogisticsSupplyEntity(UserBaseEntity user, String origin, String destination, String description,
			Integer supplyType, Date validDate, String remark, String contactUser, String contact, String address,
			Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.origin = origin;
		this.destination = destination;
		this.description = description;
		this.supplyType = supplyType;
		this.validDate = validDate;
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

	public Integer getSupplyType() {
		return supplyType;
	}

	public void setSupplyType(Integer supplyType) {
		this.supplyType = supplyType;
	}

	public Date getValidDate() {
		return validDate;
	}

	public void setValidDate(Date validDate) {
		this.validDate = validDate;
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

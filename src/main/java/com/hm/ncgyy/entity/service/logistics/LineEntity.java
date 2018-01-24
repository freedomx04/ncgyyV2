package com.hm.ncgyy.entity.service.logistics;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;

@Entity
@Table(name = "service_logistics_line")
public class LineEntity extends BaseEntity {
	
	/** 物流供应商 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;
	
	/** 发货地 */
	private String origin;
	
	/** 收货地*/
	private String destination;
	
	/** 运输方式 */
	private String transportMode;
	
	/** 参考时效 */
	private String aging;
	
	/** 重货单价（公斤） */
	private Double heavyPrice;
	
	/** 轻货单价（立方米） */
	private Double lightPrice;
	
	/** 最低一票 */
	private Double lowest;
	
	/** 联系人 */
	private String contactUser;

	/** 联系电话 */
	private String contact;
	
	public LineEntity() {
		// TODO Auto-generated constructor stub
	}

	public LineEntity(SupplierEntity supplier, String origin, String destination, String transportMode,
			String aging, Double heavyPrice, Double lightPrice, Double lowest, String contactUser, String contact, Date createTime, Date updateTime) {
		super();
		this.supplier = supplier;
		this.origin = origin;
		this.destination = destination;
		this.transportMode = transportMode;
		this.aging = aging;
		this.heavyPrice = heavyPrice;
		this.lightPrice = lightPrice;
		this.lowest = lowest;
		this.contactUser = contactUser;
		this.contact = contact;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public SupplierEntity getSupplier() {
		return supplier;
	}

	public void setSupplier(SupplierEntity supplier) {
		this.supplier = supplier;
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

	public String getTransportMode() {
		return transportMode;
	}

	public void setTransportMode(String transportMode) {
		this.transportMode = transportMode;
	}

	public String getAging() {
		return aging;
	}

	public void setAging(String aging) {
		this.aging = aging;
	}

	public Double getHeavyPrice() {
		return heavyPrice;
	}

	public void setHeavyPrice(Double heavyPrice) {
		this.heavyPrice = heavyPrice;
	}

	public Double getLightPrice() {
		return lightPrice;
	}

	public void setLightPrice(Double lightPrice) {
		this.lightPrice = lightPrice;
	}

	public Double getLowest() {
		return lowest;
	}

	public void setLowest(Double lowest) {
		this.lowest = lowest;
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

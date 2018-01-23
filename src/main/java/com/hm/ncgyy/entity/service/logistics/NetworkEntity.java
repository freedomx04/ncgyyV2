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
@Table(name = "service_logistics_network")
public class NetworkEntity extends BaseEntity {

	/** 物流供应商 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;
	
	/** 网点名称 */
	private String name;
	
	/** 网点地址 */
	private String address;
	
	/** 联系电话 */
	private String contact;
	
	/** 业务内容 */
	private String business;
	
	public NetworkEntity() {
		// TODO Auto-generated constructor stub
	}

	public NetworkEntity(SupplierEntity supplier, String name, String address, String contact,
			String business, Date createTime, Date updateTime) {
		super();
		this.supplier = supplier;
		this.name = name;
		this.address = address;
		this.contact = contact;
		this.business = business;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public SupplierEntity getSupplier() {
		return supplier;
	}

	public void setSupplier(SupplierEntity supplier) {
		this.supplier = supplier;
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

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}
	
}

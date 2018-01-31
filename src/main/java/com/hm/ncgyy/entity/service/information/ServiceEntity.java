package com.hm.ncgyy.entity.service.information;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;

@Entity
@Table(name = "service_information_service", indexes = {
	@Index(name = "index_service_information_service_updateTime", columnList = "updateTime"),
	@Index(name = "index_service_information_service_supplier", columnList = "supplier_id, updateTime"),
	@Index(name = "index_service_information_service_search", columnList = "title, updateTime")
})
public class ServiceEntity extends BaseEntity {

	/** 供应商 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;

	/** 服务标题 */
	private String title;

	/** 服务内容 */
	@Column(length = 16777216)
	private String content;

	/** 联系人 */
	private String contactUser;

	/** 联系电话 */
	private String contact;

	public ServiceEntity() {
		// TODO Auto-generated constructor stub
	}

	public ServiceEntity(SupplierEntity supplier, String title, String content, String contactUser, String contact,
			Date createTime, Date updateTime) {
		super();
		this.supplier = supplier;
		this.title = title;
		this.content = content;
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

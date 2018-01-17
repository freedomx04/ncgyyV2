package com.hm.ncgyy.entity.service.logistics;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;

@Entity
@Table(name = "service_logistics_dynamic")
public class LogisticsDynamicEntity extends BaseEntity {

	/** 物流供应商 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;

	/** 标题 */
	private String title;

	/** 来源 */
	private String source;

	/** 内容 */
	@Column(length = 16777216)
	private String content;

	public LogisticsDynamicEntity() {
		// TODO Auto-generated constructor stub
	}

	public LogisticsDynamicEntity(SupplierEntity supplier, String title, String source, String content, Date createTime,
			Date updateTime) {
		super();
		this.supplier = supplier;
		this.title = title;
		this.source = source;
		this.content = content;
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

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

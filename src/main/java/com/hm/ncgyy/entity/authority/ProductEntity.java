package com.hm.ncgyy.entity.authority;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_enterprise_product", indexes = {
	@Index(name = "index_authority_enterprise_product_name", columnList = "name") 
})
public class ProductEntity extends BaseEntity {
	
	/** 关联企业 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "enterprise_id")
    private EnterpriseBaseEntity enterprise; 
	
	/** 产品名称 */
	private String name;
	
	/** 产品图片 */
	private String imagePath;
	
	/** 规格参数 */
	@Column(length = 1000)
    private String specification;
	
	/** 产品介绍 */
	@Column(length = 4000)
    private String introduction;
	
	public ProductEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductEntity(EnterpriseBaseEntity enterprise, String name, String imagePath, String specification,
			String introduction, Date createTime, Date updateTime) {
		super();
		this.enterprise = enterprise;
		this.name = name;
		this.imagePath = imagePath;
		this.specification = specification;
		this.introduction = introduction;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public EnterpriseBaseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseBaseEntity enterprise) {
		this.enterprise = enterprise;
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

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
}

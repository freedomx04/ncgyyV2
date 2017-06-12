package com.hm.ncgyy.entity.authority;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.base.AreaEntity;

@Entity
@Table(name = "authority_enterprise")
public class EnterpriseBaseEntity extends BaseEntity {
	
	/**
	 * 企业名称
	 */
	@Column(unique = true)
	private String name;
	
	/**
	 * 企业图片
	 */
	private String avatar;
	
	/**
	 * 园区
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "area_id")
    private AreaEntity area;
	
	public EnterpriseBaseEntity() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
	} 
	
}

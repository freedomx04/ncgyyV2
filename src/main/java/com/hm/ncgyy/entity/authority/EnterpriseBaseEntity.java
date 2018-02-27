package com.hm.ncgyy.entity.authority;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity.PointStatus;

@Entity
@Table(name = "authority_enterprise")
public class EnterpriseBaseEntity extends BaseEntity {
	
	/** 企业名称 */
	@Column(unique = true)
	private String name;
	
	/** 企业图片 */
	private String avatar = "default_enterprise";
	
	/** 园区 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "area_id")
    private AreaEntity area;
	
	/** 行业 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "industry_id")
    private IndustryEntity industry; 
	
	/** 重点企业标识 */
    private Integer pointStatus = PointStatus.UNPOINT;
	
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

	public IndustryEntity getIndustry() {
		return industry;
	}

	public void setIndustry(IndustryEntity industry) {
		this.industry = industry;
	}

	public Integer getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(Integer pointStatus) {
		this.pointStatus = pointStatus;
	} 
	
}

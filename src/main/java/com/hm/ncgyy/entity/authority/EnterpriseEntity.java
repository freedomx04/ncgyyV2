package com.hm.ncgyy.entity.authority;

import java.util.Date;

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
public class EnterpriseEntity extends BaseEntity {
	
	public class PointStatus {
        public static final int UNPOINT = 0; // 非重点企业
        public static final int POINT = 1; // 重点企业
    }
	
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

//	@OneToOne(cascade = CascadeType.PERSIST)
//    @JoinColumn(name = "product_type_id")
//    private ProductTypeEntity productType; 
	
	/**
	 * 企业负责人
	 */
	private String principal;
	
	/**
	 * 主要产品
	 */
	private String mainProduct;
	
	/**
	 * 投产时间
	 */
	private Date productTime;
	
	/**
	 * 联系电话
	 */
	private String telephone;
	
	/**
	 * 地址
	 */
	private String address;
	
	/**
	 * 设计产能
	 */
	private String designCapacity;
	
	/**
	 * 主要股东
	 */
	@Column(length = 2000)
	private String shareholder;
	
	/**
	 * 注册资金
	 */
	private String registeredCapital;
	
	/**
	 * 变更记录
	 */
	private String alterRecording;
	
	/**
	 * 企业介绍
	 */
	@Column(length = 4000)
	private String introduction;
	
	/**
	 * 国税识别号
	 */
	private String nationalTax;
	
	/**
	 * 地税识别号
	 */
	private String localTax;
	
	/**
	 * 重点企业标识
	 */
    private Integer pointStatus = PointStatus.UNPOINT; 
	
}

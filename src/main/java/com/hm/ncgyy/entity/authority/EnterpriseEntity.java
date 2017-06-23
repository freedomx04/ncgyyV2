package com.hm.ncgyy.entity.authority;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;

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

	/**
	 * 行业
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "industry_id")
    private IndustryEntity industry; 
	
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
	private String productionTime;
	
	/**
	 * 联系电话
	 */
	private String telephone;
	
	/**
	 * 地址
	 */
	private String address;
	
	/**
	 * 企业法人
	 */
	private String representative; 
	
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
    
    /**
     * 企业产品
     */
    @OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "enterprise_id")
	private List<ProductEntity> productList = new LinkedList<>(); 

    /**
     * 企业新闻
     */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "enterprise_id")
	private List<NewsEntity> newsList = new LinkedList<>(); 
    
	public EnterpriseEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public EnterpriseEntity(String avatar, String name, AreaEntity area, IndustryEntity industry, String principal,
			String mainProduct, String productionTime, String telephone, String address, String representative,
			String shareholder, String registeredCapital, String alterRecording, String introduction,
			String nationalTax, String localTax, Integer pointStatus, Date createTime, Date updateTime) {
		super();
		this.avatar = avatar;
		this.name = name;
		this.area = area;
		this.industry = industry;
		this.principal = principal;
		this.mainProduct = mainProduct;
		this.productionTime = productionTime;
		this.telephone = telephone;
		this.address = address;
		this.representative = representative;
		this.shareholder = shareholder;
		this.registeredCapital = registeredCapital;
		this.alterRecording = alterRecording;
		this.introduction = introduction;
		this.nationalTax = nationalTax;
		this.localTax = localTax;
		this.pointStatus = pointStatus;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}
	
	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getMainProduct() {
		return mainProduct;
	}

	public void setMainProduct(String mainProduct) {
		this.mainProduct = mainProduct;
	}

	public String getProductionTime() {
		return productionTime;
	}

	public void setProductionTime(String productionTime) {
		this.productionTime = productionTime;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public String getShareholder() {
		return shareholder;
	}

	public void setShareholder(String shareholder) {
		this.shareholder = shareholder;
	}

	public String getRegisteredCapital() {
		return registeredCapital;
	}

	public void setRegisteredCapital(String registeredCapital) {
		this.registeredCapital = registeredCapital;
	}

	public String getAlterRecording() {
		return alterRecording;
	}

	public void setAlterRecording(String alterRecording) {
		this.alterRecording = alterRecording;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getNationalTax() {
		return nationalTax;
	}

	public void setNationalTax(String nationalTax) {
		this.nationalTax = nationalTax;
	}

	public String getLocalTax() {
		return localTax;
	}

	public void setLocalTax(String localTax) {
		this.localTax = localTax;
	}

	public Integer getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(Integer pointStatus) {
		this.pointStatus = pointStatus;
	}

	public IndustryEntity getIndustry() {
		return industry;
	}

	public void setIndustry(IndustryEntity industry) {
		this.industry = industry;
	}

	public List<ProductEntity> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductEntity> productList) {
		this.productList = productList;
	}

	public List<NewsEntity> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<NewsEntity> newsList) {
		this.newsList = newsList;
	} 
	
}

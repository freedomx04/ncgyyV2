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
public class LogisticsLineEntity extends BaseEntity {
	
	/** 物流供应商 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;
	
	/** 始发地 */
	private String origin;
	
	/** 目的地 */
	private String destination;
	
	/** 运输方式 */
	private Integer transportMode;
	
	/** 参考时效 */
	private Integer aging;
	
	/** 重货单价（公斤） */
	private Double heavyPrice;
	
	/** 轻货单价（立方米） */
	private Double lightPrice;
	
	/** 最低一票 */
	private Double lowest;
	
	public LogisticsLineEntity() {
		// TODO Auto-generated constructor stub
	}

	public LogisticsLineEntity(SupplierEntity supplier, String origin, String destination, Integer transportMode,
			Integer aging, Double heavyPrice, Double lightPrice, Double lowest, Date createTime, Date updateTime) {
		super();
		this.supplier = supplier;
		this.origin = origin;
		this.destination = destination;
		this.transportMode = transportMode;
		this.aging = aging;
		this.heavyPrice = heavyPrice;
		this.lightPrice = lightPrice;
		this.lowest = lowest;
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

	public Integer getTransportMode() {
		return transportMode;
	}

	public void setTransportMode(Integer transportMode) {
		this.transportMode = transportMode;
	}

	public Integer getAging() {
		return aging;
	}

	public void setAging(Integer aging) {
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
	
}

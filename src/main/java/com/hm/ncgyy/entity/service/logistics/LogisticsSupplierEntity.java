package com.hm.ncgyy.entity.service.logistics;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.hm.ncgyy.entity.service.SupplierEntity;

@Entity
@Table(name = "service_supplier")
public class LogisticsSupplierEntity extends SupplierEntity {
	
	/** 网点*/
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "supplier_id")
	private List<LogisticsNetworkEntity> networks = new LinkedList<>();
	
	/** 线路 */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "supplier_id")
	private List<LogisticsLineEntity> lines = new LinkedList<>();
	
	/** 动态 */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "supplier_id")
	private List<LogisticsDynamicEntity> dynamics = new LinkedList<>();
	
	public LogisticsSupplierEntity() {
		// TODO Auto-generated constructor stub
	}

	public List<LogisticsNetworkEntity> getNetworks() {
		return networks;
	}

	public void setNetworks(List<LogisticsNetworkEntity> networks) {
		this.networks = networks;
	}

	public List<LogisticsLineEntity> getLines() {
		return lines;
	}

	public void setLines(List<LogisticsLineEntity> lines) {
		this.lines = lines;
	}

	public List<LogisticsDynamicEntity> getDynamics() {
		return dynamics;
	}

	public void setDynamics(List<LogisticsDynamicEntity> dynamics) {
		this.dynamics = dynamics;
	}

}

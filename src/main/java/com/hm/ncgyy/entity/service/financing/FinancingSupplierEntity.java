package com.hm.ncgyy.entity.service.financing;

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
public class FinancingSupplierEntity extends SupplierEntity {
	
	/** 融资项目 */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "supplier_id")
	private List<FinancingEntity> financings = new LinkedList<>();
	
	/** 投资项目 */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "supplier_id")
	private List<InvestEntity> invests = new LinkedList<>();
	
	public FinancingSupplierEntity() {
		// TODO Auto-generated constructor stub
	}

	public List<FinancingEntity> getFinancings() {
		return financings;
	}

	public void setFinancings(List<FinancingEntity> financings) {
		this.financings = financings;
	}

	public List<InvestEntity> getInvests() {
		return invests;
	}

	public void setInvests(List<InvestEntity> invests) {
		this.invests = invests;
	}

}

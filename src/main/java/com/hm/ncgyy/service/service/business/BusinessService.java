package com.hm.ncgyy.service.service.business;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.business.BusinessEntity;

public interface BusinessService {
	
	BusinessEntity findOne(Long businessId);
	
	void save(BusinessEntity business);
	
	void delete(Long businessId);
	
	void delete(List<Long> businessIds);
	
	Page<BusinessEntity> list(int page, int size);
	
	List<BusinessEntity> listBySupplierId(Long supplierId);

}

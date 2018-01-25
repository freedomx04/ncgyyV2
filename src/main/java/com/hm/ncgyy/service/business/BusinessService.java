package com.hm.ncgyy.service.business;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.business.BusinessEntity;

public interface BusinessService {
	
	BusinessEntity findOne(Long businessId);
	
	void save(BusinessEntity business);
	
	void delete(Long businessId);
	
	void delete(List<Long> businessIds);
	
	List<BusinessEntity> list();
	
	Page<BusinessEntity> list(int page, int size);

}

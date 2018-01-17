package com.hm.ncgyy.service.service.financing;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.financing.FinancingEntity;

public interface FinancingService {
	
	FinancingEntity findOne(Long financingId);
	
	void save(FinancingEntity financing);
	
	void delete(Long financingId);
	
	void delete(List<Long> financingIds);
	
	Page<FinancingEntity> list(int page, int size);
	
	List<FinancingEntity> listBySupplierId(Long supplierId);
	
	Page<FinancingEntity> search(String searchStr, int page, int size);
	
	Page<FinancingEntity> filter(String profession, String financingType, int page, int size);

}

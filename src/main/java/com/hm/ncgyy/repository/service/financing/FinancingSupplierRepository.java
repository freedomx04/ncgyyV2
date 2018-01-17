package com.hm.ncgyy.repository.service.financing;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.financing.FinancingSupplierEntity;

public interface FinancingSupplierRepository extends PagingAndSortingRepository<FinancingSupplierEntity, Long> {
	
	FinancingSupplierEntity findByUserId(Long userId);

}

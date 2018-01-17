package com.hm.ncgyy.repository.service.logistics;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.logistics.LogisticsSupplierEntity;

public interface LogisticsSupplierRepository extends PagingAndSortingRepository<LogisticsSupplierEntity, Long> {
	
	LogisticsSupplierEntity findByUserId(Long userId);

}

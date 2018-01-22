package com.hm.ncgyy.repository.service;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.SupplierEntity;

public interface SupplierRepository extends PagingAndSortingRepository<SupplierEntity, Long> {

	SupplierEntity findByUserIdAndType(Long userId, Integer type);
	
	SupplierEntity findByName(String name);
	
	List<SupplierEntity> findByTypeAndStatus(Integer type, Integer status);
	
}

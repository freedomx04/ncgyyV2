package com.hm.ncgyy.repository.service;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.SupplierEntity;

public interface SupplierRepository extends PagingAndSortingRepository<SupplierEntity, Long> {

	SupplierEntity findByUserId(Long userId);
	
	SupplierEntity findByName(String name);
	
	List<SupplierEntity> findByStatus(Integer status);
	
}

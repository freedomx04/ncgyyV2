package com.hm.ncgyy.service.service;

import java.util.List;

import com.hm.ncgyy.entity.service.SupplierEntity;

public interface SupplierService {
	
	SupplierEntity findOne(Long supplierId);
	
	SupplierEntity findByName(String name);
	
	SupplierEntity findByUserId(Long userId);
	
	SupplierEntity save(SupplierEntity supplier);
	
	List<SupplierEntity> list();
	
	List<SupplierEntity> listByStatus(Integer status);
	
}

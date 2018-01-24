package com.hm.ncgyy.service.service;

import java.util.List;

import com.hm.ncgyy.entity.service.SupplierEntity;

public interface SupplierService {
	
	SupplierEntity findOne(Long supplierId);
	
	SupplierEntity findByName(String name);
	
	SupplierEntity findByUserIdAndType(Long userId, Integer type);
	
	SupplierEntity save(SupplierEntity supplier);
	
	List<SupplierEntity> list();
	
	List<SupplierEntity> listByTypeAndStatus(Integer type, Integer status);
	
	List<SupplierEntity> listCertified();
	
	List<SupplierEntity> listUncertified();
	
}

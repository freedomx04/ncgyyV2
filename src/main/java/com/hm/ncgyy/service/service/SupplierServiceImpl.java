package com.hm.ncgyy.service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.SupplierEntity;
import com.hm.ncgyy.repository.service.SupplierRepository;

@Service
public class SupplierServiceImpl implements SupplierService {
	
	@Autowired
	SupplierRepository supplierRepository;

	@Override
	public SupplierEntity findOne(Long supplierId) {
		return supplierRepository.findOne(supplierId);
	}
	
	@Override
	public SupplierEntity findByName(String name) {
		return supplierRepository.findByName(name);
	}

	@Override
	public SupplierEntity findByUserId(Long userId) {
		return supplierRepository.findByUserId(userId);
	}

	@Override
	public SupplierEntity save(SupplierEntity supplier) {
		return supplierRepository.save(supplier);
	}

	@Override
	public List<SupplierEntity> list() {
		return (List<SupplierEntity>) supplierRepository.findAll();
	}

	@Override
	public List<SupplierEntity> listByStatus(Integer status) {
		return supplierRepository.findByStatus(status);
	}

}

package com.hm.ncgyy.service.service.logistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.logistics.LogisticsSupplierEntity;
import com.hm.ncgyy.repository.service.logistics.LogisticsSupplierRepository;

@Service
public class LogisticsSupplierServiceImpl implements LogisticsSupplierService {
	
	@Autowired
	LogisticsSupplierRepository supplierRepository;

	@Override
	public LogisticsSupplierEntity findOne(Long supplierId) {
		return supplierRepository.findOne(supplierId);
	}

}

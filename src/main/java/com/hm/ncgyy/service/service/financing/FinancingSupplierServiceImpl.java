package com.hm.ncgyy.service.service.financing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.financing.FinancingSupplierEntity;
import com.hm.ncgyy.repository.service.financing.FinancingSupplierRepository;

@Service
public class FinancingSupplierServiceImpl implements FinancingSupplierService {

	@Autowired
	FinancingSupplierRepository supplierRepository;
	
	@Override
	public FinancingSupplierEntity findOne(Long supplierId) {
		return supplierRepository.findOne(supplierId);
	}

}

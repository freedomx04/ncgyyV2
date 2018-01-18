package com.hm.ncgyy.service.service.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.business.BusinessEntity;
import com.hm.ncgyy.repository.service.business.BusinessRepository;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	BusinessRepository businessRepository;

	@Override
	public BusinessEntity findOne(Long businessId) {
		return businessRepository.findOne(businessId);
	}

	@Override
	public void save(BusinessEntity business) {
		businessRepository.save(business);
	}

	@Override
	public void delete(Long businessId) {
		businessRepository.delete(businessId);
	}

	@Override
	public void delete(List<Long> businessIds) {
		Iterable<BusinessEntity> it = businessRepository.findByIdIn(businessIds);
		businessRepository.delete(it);
	}

	@Override
	public Page<BusinessEntity> list(int page, int size) {
		return businessRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public List<BusinessEntity> listBySupplierId(Long supplierId) {
		return businessRepository.findBySupplierIdOrderByUpdateTimeDesc(supplierId);
	}

}

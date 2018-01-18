package com.hm.ncgyy.repository.service.business;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.business.BusinessEntity;

public interface BusinessRepository extends PagingAndSortingRepository<BusinessEntity, Long> {

	Iterable<BusinessEntity> findByIdIn(List<Long> businessIds);
	
	Page<BusinessEntity> findByOrderByUpdateTimeDesc(Pageable pageable);
	
	List<BusinessEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId);
	
}

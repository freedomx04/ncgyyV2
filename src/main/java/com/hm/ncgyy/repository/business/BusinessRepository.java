package com.hm.ncgyy.repository.business;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.business.BusinessEntity;

public interface BusinessRepository extends PagingAndSortingRepository<BusinessEntity, Long> {

	Iterable<BusinessEntity> findByIdIn(List<Long> businessIds);
	
	List<BusinessEntity> findByOrderByUpdateTimeDesc();
	
	Page<BusinessEntity> findByOrderByUpdateTimeDesc(Pageable pageable);
	
}

package com.hm.ncgyy.repository.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.logistics.LogisticsDynamicEntity;

public interface LogisticsDynamicRepository extends PagingAndSortingRepository<LogisticsDynamicEntity, Long> {

	Iterable<LogisticsDynamicEntity> findByIdIn(List<Long> dynamicIds);
	
	List<LogisticsDynamicEntity> findByOrderByUpdateTimeDesc();
	
	Page<LogisticsDynamicEntity> findByOrderByUpdateTimeDesc(Pageable pageable);
	
	List<LogisticsDynamicEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId);
	
	Page<LogisticsDynamicEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId, Pageable pageable);
	
}

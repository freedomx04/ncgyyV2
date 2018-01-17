package com.hm.ncgyy.repository.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.logistics.LogisticsLineEntity;

public interface LogisticsLineRepository extends PagingAndSortingRepository<LogisticsLineEntity, Long> {
	
	Iterable<LogisticsLineEntity> findByIdIn(List<Long> lineIds);
	
	List<LogisticsLineEntity> findBySupplierId(Long supplierId);
	
	Page<LogisticsLineEntity> findBySupplierId(Long supplierId, Pageable pageable);
	
	Page<LogisticsLineEntity> findByOriginContainingAndDestinationContaining(String origin, String destination, Pageable pageable);

}

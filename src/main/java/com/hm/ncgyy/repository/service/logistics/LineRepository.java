package com.hm.ncgyy.repository.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.logistics.LineEntity;

public interface LineRepository extends PagingAndSortingRepository<LineEntity, Long> {
	
	Iterable<LineEntity> findByIdIn(List<Long> lineIds);
	
	List<LineEntity> findBySupplierId(Long supplierId);
	
	Page<LineEntity> findByOriginContainingAndDestinationContaining(String origin, String destination, Pageable pageable);

}

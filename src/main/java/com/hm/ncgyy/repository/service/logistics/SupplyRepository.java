package com.hm.ncgyy.repository.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.logistics.SupplyEntity;

public interface SupplyRepository extends PagingAndSortingRepository<SupplyEntity, Long> {

	Iterable<SupplyEntity> findByIdIn(List<Long> supplyIds);

	Page<SupplyEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

	List<SupplyEntity> findByUserIdOrderByUpdateTimeDesc(Long userId);

	Page<SupplyEntity> findByOriginContainingAndDestinationContainingOrderByUpdateTimeDesc(String origin,
			String destination, Pageable pageable);

}

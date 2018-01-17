package com.hm.ncgyy.repository.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.logistics.LogisticsSupplyEntity;

public interface LogisticsSupplyRepository extends PagingAndSortingRepository<LogisticsSupplyEntity, Long> {
	
	Iterable<LogisticsSupplyEntity> findByIdIn(List<Long> supplyIds);
	
	List<LogisticsSupplyEntity> findByOrderByUpdateTimeDesc();
	
	Page<LogisticsSupplyEntity> findByOrderByUpdateTimeDesc(Pageable pageable);
	
	List<LogisticsSupplyEntity> findByUserIdOrderByUpdateTimeDesc(Long userId);
	
	Page<LogisticsSupplyEntity> findByUserIdOrderByUpdateTimeDesc(Long userId, Pageable pageable);
	
	List<LogisticsSupplyEntity> findByOriginAndDestinationOrderByUpdateTimeDesc(String origin, String destination);
	
	Page<LogisticsSupplyEntity> findByOriginAndDestinationOrderByUpdateTimeDesc(String origin, String destination, Pageable pageable);

}

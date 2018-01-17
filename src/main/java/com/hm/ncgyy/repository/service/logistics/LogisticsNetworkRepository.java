package com.hm.ncgyy.repository.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.logistics.LogisticsNetworkEntity;

public interface LogisticsNetworkRepository extends PagingAndSortingRepository<LogisticsNetworkEntity, Long> {
	
	Iterable<LogisticsNetworkEntity> findByIdIn(List<Long> networkIds);
	
	List<LogisticsNetworkEntity> findBySupplierId(Long supplierId);
	
	Page<LogisticsNetworkEntity> findBySupplierId(Long supplierId, Pageable pageable);
	
	Page<LogisticsNetworkEntity> findByNameContainingOrAddressContaining(String name, String address, Pageable pageable);

}

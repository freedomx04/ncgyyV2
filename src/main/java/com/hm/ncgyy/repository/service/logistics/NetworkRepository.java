package com.hm.ncgyy.repository.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.logistics.NetworkEntity;

public interface NetworkRepository extends PagingAndSortingRepository<NetworkEntity, Long> {
	
	Iterable<NetworkEntity> findByIdIn(List<Long> networkIds);
	
	List<NetworkEntity> findBySupplierId(Long supplierId);
	
	Page<NetworkEntity> findBySupplierId(Long supplierId, Pageable pageable);
	
	Page<NetworkEntity> findByNameContainingOrAddressContaining(String name, String address, Pageable pageable);

}

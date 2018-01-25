package com.hm.ncgyy.repository.service.information;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.information.ServiceEntity;

public interface ServiceRepository extends PagingAndSortingRepository<ServiceEntity, Long> {
	
	Iterable<ServiceEntity> findByIdIn(List<Long> serviceIdList);
	
	Page<ServiceEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

	List<ServiceEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId);

}

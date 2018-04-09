package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.website.BusinessItemEntity;

public interface BusinessItemRepository extends PagingAndSortingRepository<BusinessItemEntity, Long> {

	Iterable<BusinessItemEntity> findByIdIn(List<Long> ItemIds);
	
	List<BusinessItemEntity> findByOrderByUpdateTimeDesc();
	
	Page<BusinessItemEntity> findByOrderByUpdateTimeDesc(Pageable pageable);
	
}

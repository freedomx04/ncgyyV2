package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.website.ItemEntity;

public interface ItemRepository extends PagingAndSortingRepository<ItemEntity, Long> {
	
	Iterable<ItemEntity> findByIdIn(List<Long> itemIdList);
	
	List<ItemEntity> findByOrderByUpdateTimeDesc();
	
	Page<ItemEntity> findByOrderByUpdateTimeDesc(Pageable pageable);
	
	List<ItemEntity> findByStatusOrderByUpdateTimeDesc(Integer status);
	
	Page<ItemEntity> findByStatusOrderByUpdateTimeDesc(Integer status, Pageable pageable);

}

package com.hm.ncgyy.repository.service;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.DeclareEntity;

public interface DeclareRepository extends PagingAndSortingRepository<DeclareEntity, Long> {
	
	List<DeclareEntity> findAllByOrderByUpdateTimeDesc();
	
	List<DeclareEntity> findByUserIdOrderbyUpdateTimeDesc(Long userId);
	
	List<DeclareEntity> findByStatusOrderbyUpdateTimeDesc(Integer status);

}
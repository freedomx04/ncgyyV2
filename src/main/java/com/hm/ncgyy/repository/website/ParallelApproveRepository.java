package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.website.ParallelApproveEntity;

public interface ParallelApproveRepository extends PagingAndSortingRepository<ParallelApproveEntity, Long> {

	Iterable<ParallelApproveEntity> findByIdIn(List<Long> approveIds);
	
	List<ParallelApproveEntity> findByOrderByUpdateTimeDesc();
	
}

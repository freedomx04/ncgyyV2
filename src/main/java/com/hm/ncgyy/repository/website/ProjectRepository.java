package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.website.ProjectEntity;

public interface ProjectRepository extends PagingAndSortingRepository<ProjectEntity, Long> {

	Iterable<ProjectEntity> findByIdIn(List<Long> projectIds);
	
	List<ProjectEntity> findByOrderByUpdateTimeDesc();
	
}

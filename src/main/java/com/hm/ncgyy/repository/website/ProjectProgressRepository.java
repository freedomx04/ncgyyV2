package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.website.ProjectProgressEntity;

public interface ProjectProgressRepository extends CrudRepository<ProjectProgressEntity, Long> {
	
	Iterable<ProjectProgressEntity> findByIdIn(List<Long> progressIds);
	
	List<ProjectProgressEntity> findByProjectIdOrderByUpdateTimeDesc(Long projectId);
	
}

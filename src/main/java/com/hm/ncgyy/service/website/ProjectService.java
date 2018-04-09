package com.hm.ncgyy.service.website;

import java.util.List;

import com.hm.ncgyy.entity.website.ProjectEntity;
import com.hm.ncgyy.entity.website.ProjectProgressEntity;

public interface ProjectService {
	
	ProjectEntity findOne(Long projectId);
	
	void save(ProjectEntity project);
	
	void delete(Long projectId);
	
	void delete(List<Long> projectIds);
	
	List<ProjectEntity> list();
	
	// progress
	ProjectProgressEntity findOneProgress(Long progressId);
	
	void saveProgress(ProjectProgressEntity progress);
	
	void deleteProgress(Long progressId);
	
	void deleteProgress(List<Long> progressIds);
	
	List<ProjectProgressEntity> listProgress(Long projectId);

}

package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.website.ProjectEntity;
import com.hm.ncgyy.entity.website.ProjectProgressEntity;
import com.hm.ncgyy.repository.website.ProjectProgressRepository;
import com.hm.ncgyy.repository.website.ProjectRepository;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectRepository projectRepository;
	
	@Autowired
	ProjectProgressRepository progressRepository;
	
	@Override
	public ProjectEntity findOne(Long projectId) {
		return projectRepository.findOne(projectId);
	}

	@Override
	public void save(ProjectEntity project) {
		projectRepository.save(project);
	}

	@Override
	public void delete(Long projectId) {
		projectRepository.delete(projectId);
	}

	@Override
	public void delete(List<Long> projectIds) {
		Iterable<ProjectEntity> it = projectRepository.findByIdIn(projectIds);
		projectRepository.delete(it);
	}

	@Override
	public List<ProjectEntity> list() {
		return projectRepository.findByOrderByUpdateTimeDesc();
	}
	
	// progress
	@Override
	public ProjectProgressEntity findOneProgress(Long progressId) {
		return progressRepository.findOne(progressId);
	}
	
	@Override
	public void saveProgress(ProjectProgressEntity progress) {
		progressRepository.save(progress);
	}

	@Override
	public void deleteProgress(Long progressId) {
		progressRepository.delete(progressId);
	}

	@Override
	public void deleteProgress(List<Long> progressIds) {
		Iterable<ProjectProgressEntity> it = progressRepository.findByIdIn(progressIds);
		progressRepository.delete(it);
	}

	@Override
	public List<ProjectProgressEntity> listProgress(Long projectId) {
		return progressRepository.findByProjectIdOrderByUpdateTimeDesc(projectId);
	}

}

package com.hm.ncgyy.service.service.talent;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.talent.JobEntity;

public interface JobService {

	JobEntity findOne(Long jobId);

	void save(JobEntity job);

	void delete(Long jobId);

	void delete(List<Long> jobIds);

	Page<JobEntity> list(int page, int size);

	List<JobEntity> listByUserId(Long userId);

	Page<JobEntity> search(String searchStr, int page, int size);

	Page<JobEntity> filter(String profession, String education, String workingYears, String salary, int page, int size);

}

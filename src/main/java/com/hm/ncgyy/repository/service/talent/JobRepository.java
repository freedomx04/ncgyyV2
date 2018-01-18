package com.hm.ncgyy.repository.service.talent;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.talent.JobEntity;

public interface JobRepository extends PagingAndSortingRepository<JobEntity, Long> {

	Iterable<JobEntity> findByIdIn(List<Long> jobIds);

	Page<JobEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

	List<JobEntity> findByUserIdOrderByUpdateTimeDesc(Long userId);

	Page<JobEntity> findByIntentionContainingOrderByUpdateTimeDesc(String intention, Pageable pageable);

	Page<JobEntity> findByProfessionInAndEducationInAndWorkingYearsInAndSalaryIn(List<Integer> profession,
			List<Integer> education, List<Integer> workingYears, List<Integer> salary, Pageable pageable);

}

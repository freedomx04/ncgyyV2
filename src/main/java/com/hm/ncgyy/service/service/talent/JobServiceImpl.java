package com.hm.ncgyy.service.service.talent;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.talent.JobEntity;
import com.hm.ncgyy.repository.service.talent.JobRepository;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	JobRepository jobRepository;

	@Override
	public JobEntity findOne(Long jobId) {
		return jobRepository.findOne(jobId);
	}

	@Override
	public void save(JobEntity job) {
		jobRepository.save(job);
	}

	@Override
	public void delete(Long jobId) {
		jobRepository.delete(jobId);
	}

	@Override
	public void delete(List<Long> jobIds) {
		Iterable<JobEntity> it = jobRepository.findByIdIn(jobIds);
		jobRepository.delete(it);
	}

	@Override
	public Page<JobEntity> list(int page, int size) {
		return jobRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public List<JobEntity> listByUserId(Long userId) {
		return jobRepository.findByUserIdOrderByUpdateTimeDesc(userId);
	}

	@Override
	public Page<JobEntity> search(String searchStr, int page, int size) {
		return jobRepository.findByIntentionContainingOrderByUpdateTimeDesc(searchStr, new PageRequest(page, size));
	}

	@Override
	public Page<JobEntity> filter(String profession, String education, String workingYears, String salary, int page,
			int size) {
		List<Integer> prlist = new LinkedList<>();
		for (String pr : StringUtils.split(profession, '-')) {
			prlist.add(Integer.parseInt(pr));
		}

		List<Integer> edlist = new LinkedList<>();
		for (String ed : StringUtils.split(education, '-')) {
			edlist.add(Integer.parseInt(ed));
		}

		List<Integer> wylist = new LinkedList<>();
		for (String wy : StringUtils.split(workingYears, '-')) {
			wylist.add(Integer.parseInt(wy));
		}

		List<Integer> salist = new LinkedList<>();
		for (String sa : StringUtils.split(salary, '-')) {
			salist.add(Integer.parseInt(sa));
		}

		return jobRepository.findByProfessionInAndEducationInAndWorkingYearsInAndSalaryIn(prlist, edlist, wylist,
				salist, new PageRequest(page, size));
	}

}

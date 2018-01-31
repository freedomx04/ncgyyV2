package com.hm.ncgyy.service.service.talent;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.common.utils.ConstantUtil;
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
		List<String> prlist = new LinkedList<>();
		if (StringUtils.isEmpty(profession)) {
			for (String pr : ConstantUtil.professions) {
				prlist.add(pr);
			}
		} else {
			for (String pr : StringUtils.split(profession, ',')) {
				prlist.add(pr);
			}
		}

		List<String> edlist = new LinkedList<>();
		if (StringUtils.isEmpty(education)) {
			for (String ed : ConstantUtil.educations) {
				edlist.add(ed);
			}
		} else {
			for (String ed : StringUtils.split(education, ',')) {
				edlist.add(ed);
			}
		}

		List<String> wylist = new LinkedList<>();
		if (StringUtils.isEmpty(workingYears)) {
			for (String wy : ConstantUtil.workingYearss) {
				wylist.add(wy);
			}
		} else {
			for (String wy : StringUtils.split(workingYears, ',')) {
				wylist.add(wy);
			}
		}

		List<String> salist = new LinkedList<>();
		if (StringUtils.isEmpty(salary)) {
			for (String sa : ConstantUtil.salarys) {
				salist.add(sa);
			}
		} else {
			for (String sa : StringUtils.split(salary, ',')) {
				salist.add(sa);
			}
		}

		return jobRepository.findByProfessionInAndEducationInAndWorkingYearsInAndSalaryInOrderByUpdateTimeDesc(prlist,
				edlist, wylist, salist, new PageRequest(page, size));
	}

}

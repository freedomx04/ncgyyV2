package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.website.ParallelApproveEntity;
import com.hm.ncgyy.repository.website.ParallelApproveRepository;

@Service
public class ParallelApproveServiceImpl implements ParallelApproveService {

	@Autowired
	ParallelApproveRepository approveRepository;

	@Override
	public ParallelApproveEntity findOne(Long approveId) {
		return approveRepository.findOne(approveId);
	}

	@Override
	public void save(ParallelApproveEntity approve) {
		approveRepository.save(approve);
	}

	@Override
	public void delete(Long approveId) {
		approveRepository.delete(approveId);
	}

	@Override
	public void delete(List<Long> approveIds) {
		Iterable<ParallelApproveEntity> it = approveRepository.findByIdIn(approveIds);
		approveRepository.delete(it);
	}

	@Override
	public List<ParallelApproveEntity> list() {
		return approveRepository.findByOrderByUpdateTimeDesc();
	}

}

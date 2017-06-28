package com.hm.ncgyy.service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.ApplyEntity;
import com.hm.ncgyy.repository.service.ApplyRepository;

@Service
public class ApplyServiceImpl implements ApplyService {

	@Autowired
	ApplyRepository applyRepository;

	@Override
	public ApplyEntity findOne(Long applyId) {
		return applyRepository.findOne(applyId);
	}
	
	@Override
	public ApplyEntity findOne(Long declareId, Long enterpriseId) {
		return applyRepository.findByDeclareIdAndEnterpriseId(declareId, enterpriseId);
	}

	@Override
	public void save(ApplyEntity apply) {
		applyRepository.save(apply);
	}

	@Override
	public void delete(Long applyId) {
		applyRepository.delete(applyId);
	}

	@Override
	public void delete(List<Long> applyIdList) {
		Iterable<ApplyEntity> it = applyRepository.findByIdIn(applyIdList);
		applyRepository.delete(it);
	}
	
	@Override
	public List<ApplyEntity> list(Long enterpriseId) {
		return applyRepository.findByEnterpriseId(enterpriseId);
	}
	
	@Override
	public List<ApplyEntity> listByDeclareId(Long declareId) {
		return applyRepository.findByDeclareId(declareId);
	}

}
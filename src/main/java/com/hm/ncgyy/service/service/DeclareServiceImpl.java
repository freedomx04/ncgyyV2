package com.hm.ncgyy.service.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.DeclareEntity;
import com.hm.ncgyy.repository.service.DeclareRepository;

@Service
public class DeclareServiceImpl implements DeclareService {
	
	@Autowired
	DeclareRepository declareRepository;

	@Override
	public DeclareEntity findOne(Long declareId) {
		return declareRepository.findOne(declareId);
	}

	@Override
	public void save(DeclareEntity declare) {
		declareRepository.save(declare);
	}

	@Override
	public void delete(Long declareId) {
		declareRepository.delete(declareId);
	}

	@Override
	public void delete(List<Long> declareIdList) {
		Iterable<DeclareEntity> it = declareRepository.findByIdIn(declareIdList);
		declareRepository.delete(it);
	}
	
	@Override
	public List<DeclareEntity> list() {
		return (List<DeclareEntity>) declareRepository.findAll();
	}

	@Override
	public List<DeclareEntity> listByUserId(Long userId) {
		return null;
		//return declareRepository.findByUserIdOrderbyUpdateTimeDesc(userId);
	}

	@Override
	public List<DeclareEntity> listOnline() {
		return null;
		//return declareRepository.findByStatusOrderbyUpdateTimeDesc(DeclareStatus.ONLINE);
	}

}

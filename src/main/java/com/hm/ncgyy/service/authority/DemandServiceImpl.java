package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.DemandEntity;
import com.hm.ncgyy.repository.authority.DemandRepository;

@Service
public class DemandServiceImpl implements DemandService {
	
	@Autowired
	DemandRepository demandRepository;

	@Override
	public DemandEntity findOne(Long demandId) {
		return demandRepository.findOne(demandId);
	}

	@Override
	public void save(DemandEntity demand) {
		demandRepository.save(demand);
	}

	@Override
	public void delete(Long demandId) {
		demandRepository.delete(demandId);
	}

	@Override
	public void delete(List<Long> demandIds) {
		Iterable<DemandEntity> it = demandRepository.findByIdIn(demandIds);
		demandRepository.delete(it);
	}

	@Override
	public List<DemandEntity> listByEnterpriseId(Long enterpriseId) {
		return demandRepository.findByEnterpriseIdOrderByUpdateTimeDesc(enterpriseId);
	}

	@Override
	public Page<DemandEntity> list(int page, int size) {
		return demandRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

}

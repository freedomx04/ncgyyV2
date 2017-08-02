package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity.PointStatus;
import com.hm.ncgyy.repository.authority.EnterpriseBaseRepository;
import com.hm.ncgyy.repository.authority.EnterpriseRepository;

@Service
public class EnterpriseServiceImpl implements EnterpriseService {
	
	@Autowired
	EnterpriseRepository enterpriseRepository;
	
	@Autowired
	EnterpriseBaseRepository baseRepository;

	@Override
	public EnterpriseEntity findOne(Long enterpriseId) {
		return enterpriseRepository.findOne(enterpriseId);
	}

	@Override
	public EnterpriseEntity findByName(String name) {
		return enterpriseRepository.findByName(name);
	}

	@Override
	public void save(EnterpriseEntity enterprise) {
		enterpriseRepository.save(enterprise);
	}

	@Override
	public void delete(Long enterpriseId) {
		enterpriseRepository.delete(enterpriseId);
	}

	@Override
	public List<EnterpriseEntity> list() {
		return (List<EnterpriseEntity>) enterpriseRepository.findAll();
	}

	@Override
	public Page<EnterpriseEntity> list(int page, int size) {
		return enterpriseRepository.findAll(new PageRequest(page, size));
	}
	
	@Override
	public EnterpriseBaseEntity findOneBase(Long enterpriseId) {
		return baseRepository.findOne(enterpriseId);
	}
	
	@Override
	public EnterpriseBaseEntity findByNameBase(String name) {
		return baseRepository.findByName(name);
	}

	@Override
	public List<EnterpriseBaseEntity> listBase() {
		return (List<EnterpriseBaseEntity>) baseRepository.findAll();
	}

	@Override
	public Page<EnterpriseBaseEntity> listBase(int page, int size) {
		return baseRepository.findAll(new PageRequest(page, size));
	}
	
	@Override
	public List<EnterpriseBaseEntity> listByAreaId(Long areaId) {
		return baseRepository.findByAreaId(areaId);
	}

	@Override
	public List<EnterpriseBaseEntity> listByIndustryId(Long industryId) {
		return baseRepository.findByIndustryId(industryId);
	}

	@Override
	public List<EnterpriseBaseEntity> listPoint() {
		return baseRepository.findByPointStatus(PointStatus.POINT);
	}

	@Override
	public List<EnterpriseEntity> search(String input) {
		return enterpriseRepository.findByNameContaining(input);
	}

	@Override
	public Page<EnterpriseEntity> search(String input, int page, int size) {
		return enterpriseRepository.findByNameContaining(input, new PageRequest(page, size));
	}

}

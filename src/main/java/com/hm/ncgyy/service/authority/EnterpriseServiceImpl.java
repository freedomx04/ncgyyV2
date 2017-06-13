package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
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
	public EnterpriseBaseEntity findOneBase(Long enterpriseId) {
		return baseRepository.findOne(enterpriseId);
	}

	@Override
	public List<EnterpriseBaseEntity> listBase() {
		return (List<EnterpriseBaseEntity>) baseRepository.findAll();
	}

}

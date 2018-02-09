package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.IndustryEntity;
import com.hm.ncgyy.repository.authority.IndustryRepository;

@Service
public class IndustryServiceImpl implements IndustryService {
	
	@Autowired
	IndustryRepository industryRepository;

	@Override
	public IndustryEntity findOne(Long industryId) {
		return industryRepository.findOne(industryId);
	}

	@Override
	public IndustryEntity findByName(String name) {
		return industryRepository.findByName(name);
	}

	@Override
	public void save(IndustryEntity industry) {
		industryRepository.save(industry);
	}

	@Override
	public void delete(Long industryId) {
		industryRepository.delete(industryId);
	}
	
	@Override
	public void delete(List<Long> industryIdList) {
		Iterable<IndustryEntity> it = industryRepository.findByIdIn(industryIdList);
		industryRepository.delete(it);
	}

	@Override
	public List<IndustryEntity> list() {
		return (List<IndustryEntity>) industryRepository.findAll();
	}

}

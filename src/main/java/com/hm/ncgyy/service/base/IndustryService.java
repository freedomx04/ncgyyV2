package com.hm.ncgyy.service.base;

import java.util.List;

import com.hm.ncgyy.entity.base.IndustryEntity;

public interface IndustryService {
	
	IndustryEntity findOne(Long industryId);
	
	IndustryEntity findByName(String name);
	
	void save(IndustryEntity industry);
	
	void delete(Long industryId);
	
	List<IndustryEntity> list();

}

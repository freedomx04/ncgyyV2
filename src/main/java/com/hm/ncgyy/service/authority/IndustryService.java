package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.IndustryEntity;

public interface IndustryService {
	
	IndustryEntity findOne(Long industryId);
	
	IndustryEntity findByName(String name);
	
	void save(IndustryEntity industry);
	
	void delete(Long industryId);
	
	void delete(List<Long> industryIdList);
	
	List<IndustryEntity> list();

}

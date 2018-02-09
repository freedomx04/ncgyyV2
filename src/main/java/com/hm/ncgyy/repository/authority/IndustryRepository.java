package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.IndustryEntity;

public interface IndustryRepository extends CrudRepository<IndustryEntity, Long> {
	
	Iterable<IndustryEntity> findByIdIn(List<Long> industryIdList);

	IndustryEntity findByName(String name);
	
}

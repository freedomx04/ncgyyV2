package com.hm.ncgyy.repository.base;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.base.IndustryEntity;

public interface IndustryRepository extends CrudRepository<IndustryEntity, Long> {

	IndustryEntity findByName(String name);
	
}

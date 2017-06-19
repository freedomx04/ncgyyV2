package com.hm.ncgyy.repository.base;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.base.AppealTypeEntity;

public interface AppealTypeRepository extends CrudRepository<AppealTypeEntity, Long> {
	
	AppealTypeEntity findByName(String name);

}

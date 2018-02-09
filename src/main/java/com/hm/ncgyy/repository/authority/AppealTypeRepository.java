package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.AppealTypeEntity;

public interface AppealTypeRepository extends CrudRepository<AppealTypeEntity, Long> {
	
	Iterable<AppealTypeEntity> findByIdIn(List<Long> appealTypeIdList);
	
	AppealTypeEntity findByName(String name);

}

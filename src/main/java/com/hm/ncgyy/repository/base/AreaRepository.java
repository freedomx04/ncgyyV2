package com.hm.ncgyy.repository.base;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.base.AreaEntity;

public interface AreaRepository extends CrudRepository<AreaEntity, Long> {
	
	Iterable<AreaEntity> findByIdIn(List<Long> areaIdList);
	
	AreaEntity findByName(String name);

}

package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.AreaEntity;

public interface AreaRepository extends CrudRepository<AreaEntity, Long> {
	
	Iterable<AreaEntity> findByIdIn(List<Long> areaIdList);
	
	AreaEntity findByName(String name);

}

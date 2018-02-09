package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.AreaEntity;

public interface AreaService {

	AreaEntity findOne(Long areaId);
	
	AreaEntity findByName(String name);
	
	void save(AreaEntity area);
	
	void delete(Long areaId);
	
	void delete(List<Long> areaIdList);
	
	List<AreaEntity> list();
	
}

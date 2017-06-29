package com.hm.ncgyy.service.service;

import java.util.List;

import com.hm.ncgyy.entity.service.DeclareBaseEntity;
import com.hm.ncgyy.entity.service.DeclareEntity;

public interface DeclareService {
	
	DeclareEntity findOne(Long declareId);
	
	DeclareBaseEntity findOneBase(Long declareId);
	
	void save(DeclareEntity declare);
	
	void delete(Long declareId);
	
	void delete(List<Long> declareIdList);
	
	List<DeclareEntity> list();
	
	List<DeclareEntity> listByUserId(Long userId);
	
	List<DeclareEntity> listOnline();

}

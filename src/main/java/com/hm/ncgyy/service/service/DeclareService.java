package com.hm.ncgyy.service.service;

import java.util.List;

import com.hm.ncgyy.entity.service.DeclareEntity;

public interface DeclareService {
	
	DeclareEntity findOne(Long declareId);
	
	void save(DeclareEntity declare);
	
	void delete(Long declareId);
	
	List<DeclareEntity> list();
	
	List<DeclareEntity> listByUserId(Long userId);
	
	List<DeclareEntity> listOnline();

}

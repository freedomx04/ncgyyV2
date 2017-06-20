package com.hm.ncgyy.service.base;

import java.util.List;

import com.hm.ncgyy.entity.base.AppealTypeEntity;

public interface AppealTypeService {
	
	AppealTypeEntity findOne(Long appealTypeId);
	
	AppealTypeEntity findByName(String name);
	
	void save(AppealTypeEntity appealType);
	
	void delete(Long appealTypeId);
	
	List<AppealTypeEntity> list();

}

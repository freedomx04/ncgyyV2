package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.AppealTypeEntity;

public interface AppealTypeService {
	
	AppealTypeEntity findOne(Long appealTypeId);
	
	AppealTypeEntity findByName(String name);
	
	void save(AppealTypeEntity appealType);
	
	void delete(Long appealTypeId);
	
	void delete(List<Long> appealTypeIdList);
	
	List<AppealTypeEntity> list();
	
}

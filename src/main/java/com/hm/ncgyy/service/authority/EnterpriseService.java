package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;

public interface EnterpriseService {
	
	EnterpriseEntity findOne(Long enterpriseId);
	
	EnterpriseEntity findByName(String name);
	
	void save(EnterpriseEntity enterprise);
	
	void delete(Long enterpriseId);
	
	List<EnterpriseEntity> list();
	
	EnterpriseBaseEntity findOneBase(Long enterpriseId);

}

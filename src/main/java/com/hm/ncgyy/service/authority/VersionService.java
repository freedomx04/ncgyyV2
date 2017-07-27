package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.VersionEntity;

public interface VersionService {
	
	VersionEntity findOne(Long versionId);
	
	VersionEntity findByCode(String code);
	
	void save(VersionEntity version);
	
	void delete(Long versionId);
	
	void delete(List<Long> versionIdList);
	
	List<VersionEntity> list();
	
	String getLateset();

}

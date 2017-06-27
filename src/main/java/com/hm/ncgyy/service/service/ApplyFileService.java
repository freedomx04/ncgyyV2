package com.hm.ncgyy.service.service;

import com.hm.ncgyy.entity.service.ApplyFileEntity;

public interface ApplyFileService {
	
	ApplyFileEntity fileOne(Long applyFileId);
	
	void save(ApplyFileEntity applyFile);
	
	void delete(Long applyFileId);

}

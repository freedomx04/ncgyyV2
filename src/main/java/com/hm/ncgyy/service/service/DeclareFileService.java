package com.hm.ncgyy.service.service;

import com.hm.ncgyy.entity.service.DeclareFileEntity;

public interface DeclareFileService {
	
	DeclareFileEntity fileOne(Long declareFileId);
	
	void save(DeclareFileEntity declareFile);
	
	void delete(Long declareFileId);

}

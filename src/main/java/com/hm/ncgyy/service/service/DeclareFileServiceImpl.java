package com.hm.ncgyy.service.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.DeclareFileEntity;
import com.hm.ncgyy.repository.service.DeclareFileRepository;

@Service
public class DeclareFileServiceImpl implements DeclareFileService {
	
	@Autowired
	DeclareFileRepository fileRepository;

	@Override
	public DeclareFileEntity fileOne(Long declareFileId) {
		return fileRepository.findOne(declareFileId);
	}

	@Override
	public void save(DeclareFileEntity declareFile) {
		fileRepository.save(declareFile);
	}

	@Override
	public void delete(Long declareFileId) {
		fileRepository.delete(declareFileId);
	}

}

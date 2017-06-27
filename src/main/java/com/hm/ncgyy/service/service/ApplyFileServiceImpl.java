package com.hm.ncgyy.service.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.ApplyFileEntity;
import com.hm.ncgyy.repository.service.ApplyFileRepository;

@Service
public class ApplyFileServiceImpl implements ApplyFileService {
	
	@Autowired
	ApplyFileRepository fileRepository;

	@Override
	public ApplyFileEntity fileOne(Long applyFileId) {
		return fileRepository.findOne(applyFileId);
	}

	@Override
	public void save(ApplyFileEntity applyFile) {
		fileRepository.save(applyFile);
	}

	@Override
	public void delete(Long applyFileId) {
		fileRepository.delete(applyFileId);
	}

}

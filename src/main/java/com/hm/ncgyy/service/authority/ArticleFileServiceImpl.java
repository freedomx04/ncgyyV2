package com.hm.ncgyy.service.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.ArticleFileEntity;
import com.hm.ncgyy.repository.authority.ArticleFileRepository;

@Service
public class ArticleFileServiceImpl implements ArticleFileService {
	
	@Autowired
	ArticleFileRepository fileRepository;

	@Override
	public ArticleFileEntity fileOne(Long articleFileId) {
		return fileRepository.findOne(articleFileId);
	}

	@Override
	public void save(ArticleFileEntity articleFile) {
		fileRepository.save(articleFile);
	}

	@Override
	public void delete(Long articleFileId) {
		fileRepository.delete(articleFileId);
	}

}

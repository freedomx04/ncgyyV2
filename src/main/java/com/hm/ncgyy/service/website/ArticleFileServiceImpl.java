package com.hm.ncgyy.service.website;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.website.ArticleFileEntity;
import com.hm.ncgyy.repository.website.ArticleFileRepository;

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

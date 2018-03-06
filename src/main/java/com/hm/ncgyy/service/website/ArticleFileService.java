package com.hm.ncgyy.service.website;

import com.hm.ncgyy.entity.website.ArticleFileEntity;

public interface ArticleFileService {
	
	ArticleFileEntity fileOne(Long articleFileId);
	
	void save(ArticleFileEntity articleFile);
	
	void delete(Long articleFileId);

}

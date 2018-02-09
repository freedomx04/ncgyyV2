package com.hm.ncgyy.service.authority;

import com.hm.ncgyy.entity.authority.ArticleFileEntity;

public interface ArticleFileService {
	
	ArticleFileEntity fileOne(Long articleFileId);
	
	void save(ArticleFileEntity articleFile);
	
	void delete(Long articleFileId);

}

package com.hm.ncgyy.service.issue;

import com.hm.ncgyy.entity.issue.ArticleFileEntity;

public interface ArticleFileService {
	
	ArticleFileEntity fileOne(Long articleFileId);
	
	void save(ArticleFileEntity articleFile);
	
	void delete(Long articleFileId);

}

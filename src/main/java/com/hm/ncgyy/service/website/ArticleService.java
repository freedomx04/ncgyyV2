package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.website.ArticleEntity;

public interface ArticleService {
	
	ArticleEntity findOne(Long articleId);
	
	void save(ArticleEntity article);
	
	void delete(Long articleId);
	
	void delete(List<Long> articleIdList);
	
	List<ArticleEntity> listByType(Integer type);
	
	Page<ArticleEntity> listByType(Integer type, int page, int size);
	
	String getArticleTitle(Integer type);

}

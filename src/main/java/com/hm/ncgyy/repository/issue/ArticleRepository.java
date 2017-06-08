package com.hm.ncgyy.repository.issue;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.issue.ArticleEntity;

public interface ArticleRepository extends CrudRepository<ArticleEntity, Long> {
	
	Iterable<ArticleEntity> findByIdIn(List<Long> articleIdList);
	
	List<ArticleEntity> findByTypeOrderByCreateTimeDesc(Integer type);
	
	Page<ArticleEntity> findByTypeOrderByCreateTimeDesc(Integer type, Pageable pageable);

}

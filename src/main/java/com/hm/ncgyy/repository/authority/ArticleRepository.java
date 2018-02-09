package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.ArticleEntity;

public interface ArticleRepository extends CrudRepository<ArticleEntity, Long> {
	
	Iterable<ArticleEntity> findByIdIn(List<Long> articleIdList);
	
	List<ArticleEntity> findByTypeOrderByUpdateTimeDesc(Integer type);
	
	Page<ArticleEntity> findByTypeOrderByUpdateTimeDesc(Integer type, Pageable pageable);

}

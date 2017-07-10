package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.authority.NewsEntity;

public interface NewsRepository extends PagingAndSortingRepository<NewsEntity, Long> {
	
	NewsEntity findByPath(String path); 

	List<NewsEntity> findByEnterpriseIdOrderByUpdateTime(Long enterpriseId);
	
	Page<NewsEntity> findByEnterpriseIdOrderByUpdateTime(Long enterpriseId, Pageable pageable);
	
}

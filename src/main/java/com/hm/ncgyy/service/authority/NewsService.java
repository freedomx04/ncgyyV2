package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.NewsEntity;

public interface NewsService {
	
	NewsEntity findOne(Long newsId);
	
	NewsEntity findByPath(String path);
	
	void save(NewsEntity news);
	
	void delete(Long newsId);
	
	List<NewsEntity> listByEnterpriseId(Long enterpriseId);
	
	List<NewsEntity> listByEnterpriseIdPaging(Long enterpriseId, int page, int size);
	
}

package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.NewsEntity;

public interface NewsService {
	
	NewsEntity findOne(Long newsId);
	
	void save(NewsEntity news);
	
	void delete(Long newsId);
	
	void delete(List<Long> newsIdList);
	
	List<NewsEntity> listByEnterpriseId(Long enterpriseId);
	
	List<NewsEntity> listByEnterpriseIdPaging(Long enterpriseId, int page, int size);
	
}

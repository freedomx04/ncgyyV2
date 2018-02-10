package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.repository.authority.NewsRepository;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	NewsRepository newsRepository;

	@Override
	public NewsEntity findOne(Long newsId) {
		return newsRepository.findOne(newsId);
	}

	@Override
	public void save(NewsEntity news) {
		newsRepository.save(news);
	}

	@Override
	public void delete(Long newsId) {
		newsRepository.delete(newsId);
	}
	
	@Override
	public void delete(List<Long> newsIdList) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NewsEntity> listByEnterpriseId(Long enterpriseId) {
		return newsRepository.findByEnterpriseIdOrderByUpdateTime(enterpriseId);
	}

	@Override
	public List<NewsEntity> listByEnterpriseIdPaging(Long enterpriseId, int page, int size) {
		Page<NewsEntity> newsPage = newsRepository.findByEnterpriseIdOrderByUpdateTime(enterpriseId, new PageRequest(page, size));
		return newsPage.getContent();
	}

}

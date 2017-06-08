package com.hm.ncgyy.service.issue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.repository.issue.ArticleRepository;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleRepository articleRepository;
	
	@Override
	public ArticleEntity findOne(Long articleId) {
		return articleRepository.findOne(articleId);
	}

	@Override
	public void save(ArticleEntity article) {
		articleRepository.save(article);
	}

	@Override
	public void delete(Long articleId) {
		articleRepository.delete(articleId);
	}

	@Override
	public void delete(List<Long> articleIdList) {
		Iterable<ArticleEntity> it = articleRepository.findByIdIn(articleIdList);
		articleRepository.delete(it);
	}

	@Override
	public List<ArticleEntity> listByType(Integer type) {
		return articleRepository.findByTypeOrderByCreateTimeDesc(type);
	}

	@Override
	public Page<ArticleEntity> listByType(Integer type, int page, int size) {
		return articleRepository.findByTypeOrderByCreateTimeDesc(type, new PageRequest(page, size));
	}

	@Override
	public String getArticleTitle(Integer type) {
		String title = "";
		switch (type) {
		case 1:		title = "图片新闻";		break;
		case 2:		title = "公示公告";		break;
		case 3:		title = "政策法规";		break;
		case 4:		title = "工业信息";		break;
		default:	break;
		}
		return title;
	}

}

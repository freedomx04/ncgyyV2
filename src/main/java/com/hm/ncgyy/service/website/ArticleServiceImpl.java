package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.website.ArticleEntity;
import com.hm.ncgyy.repository.website.ArticleRepository;

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
		return articleRepository.findByTypeOrderByUpdateTimeDesc(type);
	}

	@Override
	public Page<ArticleEntity> listByType(Integer type, int page, int size) {
		return articleRepository.findByTypeOrderByUpdateTimeDesc(type, new PageRequest(page, size));
	}

	@Override
	public String getArticleTitle(Integer type) {
		String title = "";
		switch (type) {
		case 1:		title = "图片新闻";		break;
		case 2:		title = "公示公告";		break;
		case 3:		title = "政策法规";		break;
		case 4:		title = "工业信息";		break;
		case 10:	title = "招商动态";		break;
		case 11:	title = "招商政策";		break;
		case 20:	title = "安全动态";		break;
		default:	break;
		}
		return title;
	}

}

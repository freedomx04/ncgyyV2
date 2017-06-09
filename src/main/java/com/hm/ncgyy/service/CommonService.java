package com.hm.ncgyy.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface CommonService {

	/**
	 * 新闻通用处理方法
	 */
	String saveArticle(String content) throws IOException;
	
	void updateArticle(String path, String content) throws IOException;
	
	String getArticleContent(String path) throws IOException;
	
	void deleteArticle(String path) throws IOException;
	
	/**
	 * 图片通用处理方法
	 */
	String saveImage(MultipartFile uploadImage) throws IOException;
	
	void deleteImage(String path) throws IOException;
	
	
}

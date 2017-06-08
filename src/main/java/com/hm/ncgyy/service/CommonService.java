package com.hm.ncgyy.service;

import java.io.IOException;

public interface CommonService {

	String saveArticle(String content) throws IOException;
	
	void updateArticle(String path, String content) throws IOException;
	
	String getArticleContent(String path) throws IOException;
	
	void deleteArticle(String path) throws IOException;
	
	
}

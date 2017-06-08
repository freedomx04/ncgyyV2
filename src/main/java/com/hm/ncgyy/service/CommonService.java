package com.hm.ncgyy.service;

import java.io.IOException;

public interface CommonService {

	String saveArticle(String content) throws IOException;
	
	String updateArticle(String path, String content) throws IOException;
	
	
}

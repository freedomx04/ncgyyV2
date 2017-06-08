package com.hm.ncgyy.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.common.utils.CommonUtils;

@Service
public class CommonServiceImpl implements CommonService {
	
	static Logger log = LoggerFactory.getLogger(CommonServiceImpl.class);
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	private String articlePath = "article";

	@Override
	public String saveArticle(String content) throws IOException {
		String path = CommonUtils.getShortUuid();
		
		File file = Paths.get(uploadPath, articlePath, path + ".html").toFile();
		com.hm.ncgyy.common.utils.FileUtils.sureDirExists(file, true);
		FileUtils.write(file, content, "UTF-8");
		
		return path;
	}

	@Override
	public String updateArticle(String path, String content) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

}

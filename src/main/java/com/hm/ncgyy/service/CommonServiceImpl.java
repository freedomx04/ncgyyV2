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
	public void updateArticle(String path, String content) throws IOException {
		File file = Paths.get(uploadPath, articlePath, path + ".html").toFile();
		if (file.exists()) {
			FileUtils.write(file, content, "UTF-8");
		} else {
			throw new IOException("article file not exist!");
		}
	}

	@Override
	public String getArticleContent(String path) throws IOException {
		File file = Paths.get(uploadPath, articlePath, path + ".html").toFile();
		if (file.exists()) {
			String content = FileUtils.readFileToString(file, "UTF-8");
			return content;
		} else {
			throw new IOException("article file not exist!");
		}
	}

	@Override
	public void deleteArticle(String path) throws IOException {
		File file = Paths.get(uploadPath, articlePath, path + ".html").toFile();
		if (file.exists()) {
			file.delete();
		} else {
			throw new IOException("article file not exist!");
		}
	}

}

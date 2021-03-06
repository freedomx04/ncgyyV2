package com.hm.ncgyy.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hm.ncgyy.common.PathFormat;
import com.hm.ncgyy.common.utils.CommonUtils;
import com.hm.ncgyy.common.utils.FileUtil;

@Service
public class CommonServiceImpl implements CommonService {
	
	static Logger log = LoggerFactory.getLogger(CommonServiceImpl.class);
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	private String articlePath = "article";
	
	@Value("${customize.path.image}")
	private String imageFormat;
	
	@Value("${customize.path.mail}")
	private String mailFormat;

	@Override
	public String saveArticle(String content) throws IOException {
		String dateFormat = "{yyyy}{mm}{dd}";
		String datepath = PathFormat.parse(dateFormat);
		String shortUuid = CommonUtils.getShortUuid();
		String path = datepath + shortUuid;
		
		File file = Paths.get(uploadPath, articlePath, datepath, shortUuid + ".html").toFile();
		FileUtil.sureDirExists(file, true);
		FileUtils.write(file, content, "UTF-8");
		
		return path;
	}

	@Override
	public void updateArticle(String path, String content) throws IOException {
		String datepath = path.substring(0, 8);
		String shortUuid = path.substring(8);
		File file = Paths.get(uploadPath, articlePath, datepath, shortUuid + ".html").toFile();
		if (file.exists()) {
			FileUtils.write(file, content, "UTF-8");
		} else {
			throw new IOException("article file not exist!");
		}
	}

	@Override
	public String getArticleContent(String path) throws IOException {
		String datepath = path.substring(0, 8);
		String shortUuid = path.substring(8);
		File file = Paths.get(uploadPath, articlePath, datepath, shortUuid + ".html").toFile();
		if (file.exists()) {
			String content = FileUtils.readFileToString(file, "UTF-8");
			return content;
		} else {
			throw new IOException("article file not exist!");
		}
	}

	@Override
	public void deleteArticle(String path) throws IOException {
		String datepath = path.substring(0, 8);
		String shortUuid = path.substring(8);
		File file = Paths.get(uploadPath, articlePath, datepath, shortUuid + ".html").toFile();
		if (file.exists()) {
			file.delete();
		}
	}

	@Override
	public String saveImage(MultipartFile uploadImage) throws IOException {
		if (uploadImage == null) {
			return "";
		}
		
		String filename = uploadImage.getOriginalFilename();
		String suffix = FileUtil.getSuffix(filename);
		
		String tarPath = imageFormat + suffix;
		tarPath = PathFormat.parse(tarPath);
		
		File file = Paths.get(uploadPath, tarPath).toFile();
		FileUtil.sureDirExists(file, true);
		
		BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
		bout.write(uploadImage.getBytes());
		bout.close();
		
		return tarPath;
	}
	
	@Override
	public void updateImage(String path, MultipartFile uploadImage) throws IOException {
		if (uploadImage == null) {
			return;
		}
		
		File file = Paths.get(uploadPath, path).toFile();
		BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
		bout.write(uploadImage.getBytes());
		bout.close();
	}

	@Override
	public void deleteImage(String path) throws IOException {
		File file = Paths.get(uploadPath, path).toFile();
		if (file.exists()) {
			file.delete();
		}
	}

	@Override
	public void deleteFile(String path) throws IOException {
		File file = Paths.get(uploadPath, path).toFile();
		if (file.exists()) {
			file.delete();
		}
	}

	@Override
	public String saveMail(String content) throws IOException {
		String path = PathFormat.parse(mailFormat + ".html");
		
		File file = Paths.get(uploadPath, path).toFile();
		FileUtil.sureDirExists(file, true);
		FileUtils.write(file, content, "UTF-8");
		
		return path;
	}

	@Override
	public String getMailContent(String path) throws IOException {
		File file = Paths.get(uploadPath, path).toFile();
		if (file.exists()) {
			String content = FileUtils.readFileToString(file, "UTF-8");
			return content;
		} else {
			throw new IOException("article file not exist!");
		}
	}

	@Override
	public void updateMail(String path, String content) throws IOException {
		File file = Paths.get(uploadPath, path).toFile();
		if (file.exists()) {
			FileUtils.write(file, content, "UTF-8");
		} else {
			throw new IOException("article file not exist!");
		}
	}

}

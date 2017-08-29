package com.hm.ncgyy.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hm.ncgyy.common.PathFormat;
import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.common.utils.CommonUtils;
import com.hm.ncgyy.common.utils.FileUtil;
import com.hm.ncgyy.service.CommonService;

@RestController
public class CommonController {
	
	static Logger log = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	CommonService commonService;
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@Value("${customize.path.avatar}")
	private String avatarPath;
	
	@Value("${customize.path.attachment}")
	private String attachmentPath;
	
	@Value("${customize.path.image}")
	private String imageFormat;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value = "/api/avatarUpload", method = RequestMethod.POST)
	public Result avatarUpload(String base64) {
		try {
			String str = base64.substring(base64.indexOf(",") + 1);
			byte[] bytes = Base64.decodeBase64(new String(str).getBytes());
            ByteArrayInputStream in = new ByteArrayInputStream(bytes);
            
            String avatar = CommonUtils.getShortUuid();
            File file = Paths.get(uploadPath, avatarPath, avatar + ".png").toFile();
            FileUtil.sureDirExists(file, true);
            
            FileOutputStream out = new FileOutputStream(file);
            IOUtils.copy(in, out);
            out.close();
			return new ResultInfo(Code.SUCCESS.value(), "updated", request.getContextPath() + "/api/avatar/" + avatar);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/avatar/{avatar}")
	public void getAvatar(@PathVariable("avatar") String avatar, HttpServletRequest request, HttpServletResponse response) {
		FileInputStream fis = null;
		try {
			OutputStream out = response.getOutputStream();
			File file = Paths.get(uploadPath, avatarPath, avatar + ".png").toFile();
			if (!file.exists()) {
				return;
			}
			
			fis = new FileInputStream(file);
			byte[] buff = new byte[fis.available()];
			fis.read(buff);
			out.write(buff);
			out.flush();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException ioe) {
					log.error(ioe.getMessage(), ioe);
				}
			}
		}
	}
	
	@RequestMapping(value = "/api/fileUpload", method = RequestMethod.POST)
	public Result fileUpload(MultipartFile attachment) {
		try {
			String filename = attachment.getOriginalFilename();
			String suffix = FileUtil.getSuffix(filename);
			
			String filepath = attachmentPath + suffix;
			filepath = PathFormat.parse(filepath);
			
			File file = Paths.get(uploadPath, filepath).toFile();
			FileUtil.sureDirExists(file, true);
			
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
			IOUtils.copy(attachment.getInputStream(), bout);
			bout.close();
			
			return new ResultInfo(Code.SUCCESS.value(), "updated", filename + "?" + filepath);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/fileDelete")
	public Result fileDelete(String filepath) {
		try {
			File file = Paths.get(uploadPath, filepath).toFile();
			if (file.exists()) {
				file.delete();
			}
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/downloadFile")
	public ResponseEntity<InputStreamResource> downloadFile(String filename, String filepath) {
		try {
			File file = Paths.get(uploadPath, filepath).toFile();
			if (!file.exists()) {
				return null;
			}
			FileSystemResource fsr = new FileSystemResource(file);
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
            headers.add("Content-Disposition",
                    String.format("attachment; filename=\"%s\"", new String(filename.getBytes("UTF-8"), "ISO8859-1")));
            headers.add("Pragma", "no-cache");
            headers.add("Expires", "0");
			
			return ResponseEntity.ok().headers(headers).contentLength(fsr.contentLength())
                    .contentType(MediaType.parseMediaType("application/octet-stream"))
                    .body(new InputStreamResource(fsr.getInputStream()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
            return null;
		}
	}
	
	@RequestMapping(value = "/api/uploadImage")
	public Result uploadImage(MultipartFile imageFile) {
		try {
			if (imageFile == null) {
				return null;
			}
			
			String filename = imageFile.getOriginalFilename();
			String suffix = FileUtil.getSuffix(filename);
			
			String tarPath = imageFormat + suffix;
			tarPath = PathFormat.parse(tarPath);
			
			File file = Paths.get(uploadPath, tarPath).toFile();
			FileUtil.sureDirExists(file, true);
			
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(file));
			bout.write(imageFile.getBytes());
			bout.close();
			
			return new ResultInfo(Code.SUCCESS.value(), "upload", tarPath);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

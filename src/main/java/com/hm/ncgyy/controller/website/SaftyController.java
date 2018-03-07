package com.hm.ncgyy.controller.website;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.website.VideoEntity;
import com.hm.ncgyy.service.website.VideoService;

@RestController
public class SaftyController {
	
	static Logger log = LoggerFactory.getLogger(SaftyController.class);
	
	@Autowired
	VideoService videoService;
	
	@RequestMapping(value = "/api/weisite/safty/video/create", method = RequestMethod.POST)
	public Result create(String title, String videoPath, String imagePath, String content) {
		try {
			Date now = new Date();
			VideoEntity video = new VideoEntity(title, videoPath, imagePath, content, now, now);
			videoService.save(video);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/weisite/safty/video/update", method = RequestMethod.POST)
	public Result update(Long videoId, String title, String videoPath, String imagePath, String content) {
		try {
			VideoEntity video = videoService.findOne(videoId);
			video.setTitle(title);
			video.setVideoPath(videoPath);
			video.setImagePath(imagePath);
			video.setContent(content);
			video.setUpdateTime(new Date());
			videoService.save(video);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/safty/video/delete")
	public Result delete(Long videoId) {
		try {
			videoService.delete(videoId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/safty/video/deleteBatch")
	public Result deleteBatch(@RequestParam("videoIdList[]") List<Long> videoIdList) {
		try {
			videoService.delete(videoIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/safty/video/get")
	public Result get(Long videoId) {
		try {
			VideoEntity video = videoService.findOne(videoId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", video);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/safty/video/list")
	public Result list() {
		try {
			List<VideoEntity> list = videoService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/safty/video/listPaging")
	public Result listPaging(int page, int size) {
		try {
			Page<VideoEntity> list = videoService.listPaging(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

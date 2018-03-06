package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.website.VideoEntity;

public interface VideoService {
	
	VideoEntity findOne(Long videoId);
	
	void save(VideoEntity video);
	
	void delete(Long videoId);
	
	void delete(List<Long> videoIdList);
	
	List<VideoEntity> list();
	
	Page<VideoEntity> listPaging(int page, int size);

}

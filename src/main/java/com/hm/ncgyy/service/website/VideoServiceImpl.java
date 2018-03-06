package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.website.VideoEntity;
import com.hm.ncgyy.repository.website.VideoRepository;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	VideoRepository videoRepository;

	@Override
	public VideoEntity findOne(Long videoId) {
		return videoRepository.findOne(videoId);
	}

	@Override
	public void save(VideoEntity video) {
		videoRepository.save(video);
	}

	@Override
	public void delete(Long videoId) {
		videoRepository.delete(videoId);
	}

	@Override
	public void delete(List<Long> videoIdList) {
		Iterable<VideoEntity> it = videoRepository.findByIdIn(videoIdList);
		videoRepository.delete(it);
	}

	@Override
	public List<VideoEntity> list() {
		return videoRepository.findByOrderByUpdateTimeDesc();
	}

	@Override
	public Page<VideoEntity> listPaging(int page, int size) {
		return videoRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

}

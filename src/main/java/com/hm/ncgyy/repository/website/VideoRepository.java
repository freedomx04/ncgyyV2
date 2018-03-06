package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.website.VideoEntity;

public interface VideoRepository extends PagingAndSortingRepository<VideoEntity, Long> {
	
	Iterable<VideoEntity> findByIdIn(List<Long> videoIdList);
	
	List<VideoEntity> findByUpdateTimeDesc();
	
	Page<VideoEntity> findOrderByUpdateTimeDesc(Pageable pageable);

}

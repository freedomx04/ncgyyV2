package com.hm.ncgyy.repository.assist;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.assist.UrgeEntity;

public interface UrgeRepository extends CrudRepository<UrgeEntity, Long> {
	
	List<UrgeEntity> findByAppealIdOrderByCreateTime(Long appealId);
	
	List<UrgeEntity> findByUserIdOrderByCreateTime(Long userId);

}

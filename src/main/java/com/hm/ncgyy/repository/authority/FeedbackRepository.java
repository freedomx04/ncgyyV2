package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.FeedbackEntity;

public interface FeedbackRepository extends CrudRepository<FeedbackEntity, Long> {
	
	Iterable<FeedbackEntity> findByIdIn(List<Long> feedbackIdList);
	
	List<FeedbackEntity> findByOrderByUpdateTimeDesc();

}

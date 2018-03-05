package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.website.FeedbackEntity;

public interface FeedbackRepository extends CrudRepository<FeedbackEntity, Long> {
	
	Iterable<FeedbackEntity> findByIdIn(List<Long> feedbackIdList);
	
	List<FeedbackEntity> findByOrderByUpdateTimeDesc();

}

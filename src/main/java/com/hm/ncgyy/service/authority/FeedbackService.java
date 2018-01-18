package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.FeedbackEntity;

public interface FeedbackService {
	
	FeedbackEntity findOne(Long feedbackId);
	
	void save(FeedbackEntity feedback);
	
	void delete(Long feedbackId);
	
	void delete(List<Long> feedbackIds);
	
	List<FeedbackEntity> list();

}

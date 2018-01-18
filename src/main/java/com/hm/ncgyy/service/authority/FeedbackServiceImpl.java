package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.FeedbackEntity;
import com.hm.ncgyy.repository.authority.FeedbackRepository;

@Service
public class FeedbackServiceImpl implements FeedbackService {
	
	@Autowired
	FeedbackRepository feedbacakRepository;

	@Override
	public FeedbackEntity findOne(Long feedbackId) {
		return feedbacakRepository.findOne(feedbackId);
	}

	@Override
	public void save(FeedbackEntity feedback) {
		feedbacakRepository.save(feedback);
	}

	@Override
	public void delete(Long feedbackId) {
		feedbacakRepository.delete(feedbackId);
	}

	@Override
	public void delete(List<Long> feedbackIds) {
		Iterable<FeedbackEntity> it = feedbacakRepository.findByIdIn(feedbackIds);
		feedbacakRepository.delete(it);
	}

	@Override
	public List<FeedbackEntity> list() {
		return feedbacakRepository.findByOrderByUpdateTimeDesc();
	}

}

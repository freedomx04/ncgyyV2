package com.hm.ncgyy.service.office;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.office.SendEntity;
import com.hm.ncgyy.repository.office.SendRepository;

@Service
public class SendServiceImpl implements SendService {
	
	@Autowired
	SendRepository sendRepository;

	@Override
	public SendEntity findOne(Long sendId) {
		return sendRepository.findOne(sendId);
	}

	@Override
	public void save(SendEntity send) {
		sendRepository.save(send);
	}

	
}

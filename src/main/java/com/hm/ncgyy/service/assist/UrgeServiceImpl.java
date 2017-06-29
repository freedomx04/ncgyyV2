package com.hm.ncgyy.service.assist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.assist.UrgeEntity;
import com.hm.ncgyy.repository.assist.UrgeRepository;

@Service
public class UrgeServiceImpl implements UrgeService {

	@Autowired
	UrgeRepository urgeRepository;
	
	@Override
	public void save(UrgeEntity urge) {
		urgeRepository.save(urge);
	}

}

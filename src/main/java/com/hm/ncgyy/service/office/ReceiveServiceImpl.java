package com.hm.ncgyy.service.office;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.office.ReceiveEntity;
import com.hm.ncgyy.repository.office.ReceiveRepository;

@Service
public class ReceiveServiceImpl implements ReceiveService {
	
	@Autowired
	ReceiveRepository receiveRepository;

	@Override
	public ReceiveEntity findOne(Long receiveId) {
		return receiveRepository.findOne(receiveId);
	}

	@Override
	public void save(ReceiveEntity receive) {
		receiveRepository.save(receive);
	}

}

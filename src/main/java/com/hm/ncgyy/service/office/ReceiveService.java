package com.hm.ncgyy.service.office;

import com.hm.ncgyy.entity.office.ReceiveEntity;

public interface ReceiveService {
	
	ReceiveEntity findOne(Long receiveId);
	
	void save(ReceiveEntity receive);

}

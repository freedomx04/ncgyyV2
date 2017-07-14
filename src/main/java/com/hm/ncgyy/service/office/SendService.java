package com.hm.ncgyy.service.office;

import com.hm.ncgyy.entity.office.SendEntity;

public interface SendService {
	
	SendEntity findOne(Long sendId);
	
	void save(SendEntity send);

}

package com.hm.ncgyy.service.dataCenter;

import com.hm.ncgyy.entity.dataCenter.EconomicDataEntity;

public interface EconomicDataService {
	
	EconomicDataEntity findOne(Long economicId);
	
	EconomicDataEntity findOne(Integer year, Integer month);
	
	void save(EconomicDataEntity economic);
	
}

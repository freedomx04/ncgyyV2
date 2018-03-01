package com.hm.ncgyy.service.monitor;

import java.util.List;

import com.hm.ncgyy.entity.monitor.EconomicEntity;

public interface EconomicService {
	
	EconomicEntity findOne(Long economicId);
	
	EconomicEntity findOne(String monthly, Integer type);
	
	void save(EconomicEntity economic);
	
	void delete(Long economicId);
	
	List<EconomicEntity> list(Integer type);
	
	List<EconomicEntity> listByMonthlyInAndType(List<String> monthlyList, Integer type);

}

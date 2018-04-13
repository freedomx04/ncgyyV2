package com.hm.ncgyy.service.dataCenter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.dataCenter.EconomicDataEntity;
import com.hm.ncgyy.repository.dataCenter.EconomicDataRepository;

@Service
public class EconomicDataServiceImpl implements EconomicDataService {
	
	@Autowired
	EconomicDataRepository economicRepository;

	@Override
	public EconomicDataEntity findOne(Long economicId) {
		return economicRepository.findOne(economicId);
	}
	
	@Override
	public EconomicDataEntity findOne(Integer year, Integer month) {
		return economicRepository.findByYearAndMonth(year, month);
	}

	@Override
	public void save(EconomicDataEntity economic) {
		economicRepository.save(economic);
	}

}

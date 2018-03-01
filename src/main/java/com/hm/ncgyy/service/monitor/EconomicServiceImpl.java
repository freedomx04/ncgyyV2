package com.hm.ncgyy.service.monitor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.monitor.EconomicEntity;
import com.hm.ncgyy.repository.monitor.EconomicRepository;

@Service
public class EconomicServiceImpl implements EconomicService {
	
	@Autowired
	EconomicRepository economicRepository;

	@Override
	public EconomicEntity findOne(Long economicId) {
		return economicRepository.findOne(economicId);
	}

	@Override
	public EconomicEntity findOne(String monthly, Integer type) {
		return economicRepository.findByMonthlyAndType(monthly, type);
	}

	@Override
	public void save(EconomicEntity economic) {
		economicRepository.save(economic);
	}

	@Override
	public void delete(Long economicId) {
		economicRepository.delete(economicId);
	}
	
	@Override
	public void delete(List<Long> economicIds) {
		Iterable<EconomicEntity> it = economicRepository.findByIdIn(economicIds);
		economicRepository.delete(it);
	}

	@Override
	public List<EconomicEntity> list(Integer type) {
		return economicRepository.findByTypeOrderByMonthlyAsc(type);
	}

	@Override
	public List<EconomicEntity> listByMonthlyInAndType(List<String> monthlyList, Integer type) {
		return economicRepository.findByMonthlyInAndType(monthlyList, type);
	}

}

package com.hm.ncgyy.repository.monitor;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.monitor.EconomicEntity;

public interface EconomicRepository extends CrudRepository<EconomicEntity, Long> {
	
	Iterable<EconomicEntity> findByIdIn(List<Long> economicIds);

	EconomicEntity findByMonthlyAndType(String monthly, Integer type);
	
	List<EconomicEntity> findByTypeOrderByMonthlyAsc(Integer type);
	
	List<EconomicEntity> findByMonthlyInAndType(List<String> monthlyList, Integer type);
	
}

package com.hm.ncgyy.repository.dataCenter;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.dataCenter.EconomicDataEntity;

public interface EconomicDataRepository extends CrudRepository<EconomicDataEntity, Long> {
	
	EconomicDataEntity findByYearAndMonth(Integer year, Integer month);
	
	List<EconomicDataEntity> findByYearOrderByMonthAsc(Integer year);

}

package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.logistics.LogisticsSupplyEntity;

public interface LogisticsSupplyService {
	
	LogisticsSupplyEntity findOne(Long supplyId);
	
	void save(LogisticsSupplyEntity supply);
	
	void delete(Long supplyId);
	
	void delete(List<Long> supplyIds);
	
	List<LogisticsSupplyEntity> list();
	
	Page<LogisticsSupplyEntity> list(int page, int size);
	
	List<LogisticsSupplyEntity> listByUserId(Long userId);
	
	Page<LogisticsSupplyEntity> listByUserId(Long userId, int page, int size);
	
	Page<LogisticsSupplyEntity> search(String origin, String destination, int page, int size);

}

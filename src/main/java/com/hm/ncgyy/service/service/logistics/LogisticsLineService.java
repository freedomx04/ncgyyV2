package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.logistics.LogisticsLineEntity;

public interface LogisticsLineService {
	
	LogisticsLineEntity findOne(Long lineId);
	
	void save(LogisticsLineEntity line);
	
	void delete(Long lineId);
	
	void delete(List<Long> lineIds);
	
	List<LogisticsLineEntity> list();
	
	Page<LogisticsLineEntity> list(int page, int size);
	
	List<LogisticsLineEntity> listBySupplierId(Long supplierId);
	
	Page<LogisticsLineEntity> listBySupplierId(Long supplierId, int page, int size);
	
	Page<LogisticsLineEntity> search(String origin, String destination, int page, int size);
	
}

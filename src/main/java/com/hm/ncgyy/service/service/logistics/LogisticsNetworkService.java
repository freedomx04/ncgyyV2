package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.logistics.LogisticsNetworkEntity;

public interface LogisticsNetworkService {
	
	LogisticsNetworkEntity findOne(Long networkId);
	
	void save(LogisticsNetworkEntity network);
	
	void delete(Long networkId);
	
	void delete(List<Long> networkIds);
	
	List<LogisticsNetworkEntity> list();
	
	Page<LogisticsNetworkEntity> list(int page, int size);
	
	List<LogisticsNetworkEntity> listBySupplierId(Long supplierId);
	
	Page<LogisticsNetworkEntity> listBySupplierId(Long supplierId, int page, int size);
	
	Page<LogisticsNetworkEntity> search(String searchStr, int page, int size);

}

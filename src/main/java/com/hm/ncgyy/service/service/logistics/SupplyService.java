package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.logistics.SupplyEntity;

public interface SupplyService {
	
	SupplyEntity findOne(Long supplyId);
	
	void save(SupplyEntity supply);
	
	void delete(Long supplyId);
	
	void delete(List<Long> supplyIds);
	
	Page<SupplyEntity> list(int page, int size);
	
	List<SupplyEntity> listByUserId(Long userId);
	
	Page<SupplyEntity> search(String origin, String destination, int page, int size);

}

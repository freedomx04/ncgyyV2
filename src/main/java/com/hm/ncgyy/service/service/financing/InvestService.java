package com.hm.ncgyy.service.service.financing;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.financing.InvestEntity;

public interface InvestService {

	InvestEntity findOne(Long investId);
	
	void save(InvestEntity invest);
	
	void delete(Long investId);
	
	void delete(List<Long> investIds);
	
	Page<InvestEntity> list(int page, int size);
	
	List<InvestEntity> listBySupplierId(Long supplierId);
	
	Page<InvestEntity> search(String searchStr, int page, int size);
	
	Page<InvestEntity> filter(String investType, String fundType, int page, int size);
	
}

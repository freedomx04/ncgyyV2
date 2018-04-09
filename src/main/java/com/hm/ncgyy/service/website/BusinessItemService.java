package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.website.BusinessItemEntity;

public interface BusinessItemService {
	
	BusinessItemEntity findOne(Long ItemId);
	
	void save(BusinessItemEntity Item);
	
	void delete(Long ItemId);
	
	void delete(List<Long> ItemIds);
	
	List<BusinessItemEntity> list();
	
	Page<BusinessItemEntity> list(int page, int size);

}

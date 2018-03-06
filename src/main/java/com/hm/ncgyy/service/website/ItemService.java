package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.website.ItemEntity;

public interface ItemService {
	
	ItemEntity findOne(Long ItemId);
	
	void save(ItemEntity Item);
	
	void delete(Long ItemId);
	
	void delete(List<Long> ItemIds);
	
	List<ItemEntity> list();
	
	Page<ItemEntity> list(int page, int size);

}

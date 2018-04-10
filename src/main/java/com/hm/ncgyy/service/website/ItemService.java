package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.website.ItemEntity;

public interface ItemService {
	
	ItemEntity findOne(Long itemId);
	
	void save(ItemEntity item);
	
	void delete(Long itemId);
	
	List<ItemEntity> list();
	
	Page<ItemEntity> list(int page, int size);
	
	List<ItemEntity> listByStatus(Integer status);
	
	Page<ItemEntity> listByStatus(Integer status, int page, int size);
	
}

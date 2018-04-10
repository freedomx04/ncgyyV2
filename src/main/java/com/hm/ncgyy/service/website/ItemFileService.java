package com.hm.ncgyy.service.website;

import java.util.List;

import com.hm.ncgyy.entity.website.ItemFileEntity;

public interface ItemFileService {
	
	ItemFileEntity findOne(Long itemFileId);
	
	void save(ItemFileEntity itemFile);
	
	void delete(Long itemFileId);
	
	List<ItemFileEntity> listByItemId(Long itemId);

}

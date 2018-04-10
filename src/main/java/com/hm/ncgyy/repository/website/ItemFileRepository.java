package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.website.ItemFileEntity;

public interface ItemFileRepository extends CrudRepository<ItemFileEntity, Long> {

	List<ItemFileEntity> findByItemId(Long itemId);
	
}

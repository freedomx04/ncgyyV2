package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.website.ItemEntity;
import com.hm.ncgyy.repository.website.ItemRepository;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	ItemRepository itemRepository;

	@Override
	public ItemEntity findOne(Long ItemId) {
		return itemRepository.findOne(ItemId);
	}

	@Override
	public void save(ItemEntity Item) {
		itemRepository.save(Item);
	}

	@Override
	public void delete(Long ItemId) {
		itemRepository.delete(ItemId);
	}

	@Override
	public void delete(List<Long> ItemIds) {
		Iterable<ItemEntity> it = itemRepository.findByIdIn(ItemIds);
		itemRepository.delete(it);
	}

	@Override
	public List<ItemEntity> list() {
		return itemRepository.findByOrderByUpdateTimeDesc();
	}
	
	@Override
	public Page<ItemEntity> list(int page, int size) {
		return itemRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

}

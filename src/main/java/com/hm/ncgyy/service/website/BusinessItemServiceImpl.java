package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.website.BusinessItemEntity;
import com.hm.ncgyy.repository.website.BusinessItemRepository;

@Service
public class BusinessItemServiceImpl implements BusinessItemService {
	
	@Autowired
	BusinessItemRepository itemRepository;

	@Override
	public BusinessItemEntity findOne(Long ItemId) {
		return itemRepository.findOne(ItemId);
	}

	@Override
	public void save(BusinessItemEntity Item) {
		itemRepository.save(Item);
	}

	@Override
	public void delete(Long ItemId) {
		itemRepository.delete(ItemId);
	}

	@Override
	public void delete(List<Long> ItemIds) {
		Iterable<BusinessItemEntity> it = itemRepository.findByIdIn(ItemIds);
		itemRepository.delete(it);
	}

	@Override
	public List<BusinessItemEntity> list() {
		return itemRepository.findByOrderByUpdateTimeDesc();
	}
	
	@Override
	public Page<BusinessItemEntity> list(int page, int size) {
		return itemRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

}

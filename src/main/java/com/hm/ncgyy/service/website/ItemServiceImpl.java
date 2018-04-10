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
	public ItemEntity findOne(Long itemId) {
		return itemRepository.findOne(itemId);
	}

	@Override
	public void save(ItemEntity item) {
		itemRepository.save(item);
	}

	@Override
	public void delete(Long itemId) {
		itemRepository.delete(itemId);
	}

	@Override
	public List<ItemEntity> list() {
		return itemRepository.findByOrderByUpdateTimeDesc();
	}

	@Override
	public Page<ItemEntity> list(int page, int size) {
		return itemRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public List<ItemEntity> listByStatus(Integer status) {
		return itemRepository.findByStatusOrderByUpdateTimeDesc(status);
	}

	@Override
	public Page<ItemEntity> listByStatus(Integer status, int page, int size) {
		return itemRepository.findByStatusOrderByUpdateTimeDesc(status, new PageRequest(page, size));
	}

}

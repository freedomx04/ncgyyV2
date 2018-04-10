package com.hm.ncgyy.service.website;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.website.ItemFileEntity;
import com.hm.ncgyy.repository.website.ItemFileRepository;

@Service
public class ItemFileServiceImpl implements ItemFileService {
	
	@Autowired
	ItemFileRepository itemFileRepository;

	@Override
	public ItemFileEntity findOne(Long itemFileId) {
		return itemFileRepository.findOne(itemFileId);
	}

	@Override
	public void save(ItemFileEntity itemFile) {
		itemFileRepository.save(itemFile);
	}

	@Override
	public void delete(Long itemFileId) {
		itemFileRepository.delete(itemFileId);
	}

	@Override
	public List<ItemFileEntity> listByItemId(Long itemId) {
		return itemFileRepository.findByItemId(itemId);
	}

}

package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.logistics.LogisticsDynamicEntity;
import com.hm.ncgyy.repository.service.logistics.LogisticsDynamicRepository;

@Service
public class LogisticsDynamicServiceImpl implements LogisticsDynamicService {
	
	@Autowired
	LogisticsDynamicRepository dynamicRepository;

	@Override
	public LogisticsDynamicEntity findOne(Long dynamicId) {
		return dynamicRepository.findOne(dynamicId);
	}

	@Override
	public void save(LogisticsDynamicEntity dynamic) {
		dynamicRepository.save(dynamic);
	}

	@Override
	public void delete(Long dynamicId) {
		dynamicRepository.delete(dynamicId);
	}

	@Override
	public void delete(List<Long> dynamicIds) {
		Iterable<LogisticsDynamicEntity> it = dynamicRepository.findByIdIn(dynamicIds);
		dynamicRepository.delete(it);
	}

	@Override
	public List<LogisticsDynamicEntity> list() {
		return dynamicRepository.findByOrderByUpdateTimeDesc();
	}

	@Override
	public Page<LogisticsDynamicEntity> list(int page, int size) {
		return dynamicRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public List<LogisticsDynamicEntity> listBySupplierId(Long supplierId) {
		return dynamicRepository.findBySupplierIdOrderByUpdateTimeDesc(supplierId);
	}

	@Override
	public Page<LogisticsDynamicEntity> listBySupplierId(Long supplierId, int page, int size) {
		return dynamicRepository.findBySupplierIdOrderByUpdateTimeDesc(supplierId, new PageRequest(page, size));
	}

}

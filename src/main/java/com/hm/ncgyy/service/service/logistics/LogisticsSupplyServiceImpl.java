package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.logistics.LogisticsSupplyEntity;
import com.hm.ncgyy.repository.service.logistics.LogisticsSupplyRepository;

@Service
public class LogisticsSupplyServiceImpl implements LogisticsSupplyService {
	
	@Autowired
	LogisticsSupplyRepository supplyRepository;

	@Override
	public LogisticsSupplyEntity findOne(Long supplyId) {
		return supplyRepository.findOne(supplyId);
	}

	@Override
	public void save(LogisticsSupplyEntity supply) {
		supplyRepository.save(supply);
	}

	@Override
	public void delete(Long supplyId) {
		supplyRepository.delete(supplyId);
	}

	@Override
	public void delete(List<Long> supplyIds) {
		Iterable<LogisticsSupplyEntity> it = supplyRepository.findByIdIn(supplyIds);
		supplyRepository.delete(it);
	}

	@Override
	public List<LogisticsSupplyEntity> list() {
		return supplyRepository.findByOrderByUpdateTimeDesc();
	}

	@Override
	public Page<LogisticsSupplyEntity> list(int page, int size) {
		return supplyRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public List<LogisticsSupplyEntity> listByUserId(Long userId) {
		return supplyRepository.findByUserIdOrderByUpdateTimeDesc(userId);
	}

	@Override
	public Page<LogisticsSupplyEntity> listByUserId(Long userId, int page, int size) {
		return supplyRepository.findByUserIdOrderByUpdateTimeDesc(userId, new PageRequest(page, size));
	}

	@Override
	public Page<LogisticsSupplyEntity> search(String origin, String destination, int page, int size) {
		return supplyRepository.findByOriginAndDestinationOrderByUpdateTimeDesc(origin, destination, new PageRequest(page, size));
	}

}

package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.logistics.LogisticsLineEntity;
import com.hm.ncgyy.repository.service.logistics.LogisticsLineRepository;

@Service
public class LogisticsLineServiceImpl implements LogisticsLineService {
	
	@Autowired
	LogisticsLineRepository lineRepository;

	@Override
	public LogisticsLineEntity findOne(Long lineId) {
		return lineRepository.findOne(lineId);
	}

	@Override
	public void save(LogisticsLineEntity line) {
		lineRepository.save(line);
	}

	@Override
	public void delete(Long lineId) {
		lineRepository.delete(lineId);
	}

	@Override
	public void delete(List<Long> lineIds) {
		Iterable<LogisticsLineEntity> it = lineRepository.findByIdIn(lineIds);
		lineRepository.delete(it);
	}

	@Override
	public List<LogisticsLineEntity> list() {
		return (List<LogisticsLineEntity>) lineRepository.findAll();
	}

	@Override
	public Page<LogisticsLineEntity> list(int page, int size) {
		return lineRepository.findAll(new PageRequest(page, size));
	}

	@Override
	public List<LogisticsLineEntity> listBySupplierId(Long supplierId) {
		return lineRepository.findBySupplierId(supplierId);
	}

	@Override
	public Page<LogisticsLineEntity> listBySupplierId(Long supplierId, int page, int size) {
		return lineRepository.findBySupplierId(supplierId, new PageRequest(page, size));
	}

	@Override
	public Page<LogisticsLineEntity> search(String origin, String destination, int page, int size) {
		return lineRepository.findByOriginContainingAndDestinationContaining(origin, destination, new PageRequest(page, size));
	}

}

package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.logistics.LineEntity;
import com.hm.ncgyy.repository.service.logistics.LineRepository;

@Service
public class LineServiceImpl implements LineService {

	@Autowired
	LineRepository lineRepository;

	@Override
	public LineEntity findOne(Long lineId) {
		return lineRepository.findOne(lineId);
	}

	@Override
	public void save(LineEntity line) {
		lineRepository.save(line);
	}

	@Override
	public void delete(Long lineId) {
		lineRepository.delete(lineId);
	}

	@Override
	public void delete(List<Long> lineIds) {
		Iterable<LineEntity> it = lineRepository.findByIdIn(lineIds);
		lineRepository.delete(it);
	}

	@Override
	public Page<LineEntity> list(int page, int size) {
		return lineRepository.findAll(new PageRequest(page, size));
	}

	@Override
	public List<LineEntity> listBySupplierId(Long supplierId) {
		return lineRepository.findBySupplierId(supplierId);
	}

	@Override
	public Page<LineEntity> search(String origin, String destination, int page, int size) {
		return lineRepository.findByOriginContainingAndDestinationContaining(origin, destination,
				new PageRequest(page, size));
	}

}

package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.logistics.SupplyEntity;
import com.hm.ncgyy.repository.service.logistics.SupplyRepository;

@Service
public class SupplyServiceImpl implements SupplyService {

	@Autowired
	SupplyRepository supplyRepository;

	@Override
	public SupplyEntity findOne(Long supplyId) {
		return supplyRepository.findOne(supplyId);
	}

	@Override
	public void save(SupplyEntity supply) {
		supplyRepository.save(supply);
	}

	@Override
	public void delete(Long supplyId) {
		supplyRepository.delete(supplyId);
	}

	@Override
	public void delete(List<Long> supplyIds) {
		Iterable<SupplyEntity> it = supplyRepository.findByIdIn(supplyIds);
		supplyRepository.delete(it);
	}

	@Override
	public Page<SupplyEntity> list(int page, int size) {
		return supplyRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public List<SupplyEntity> listByUserId(Long userId) {
		return supplyRepository.findByUserIdOrderByUpdateTimeDesc(userId);
	}

	@Override
	public Page<SupplyEntity> search(String origin, String destination, int page, int size) {
		return supplyRepository.findByOriginAndDestinationOrderByUpdateTimeDesc(origin, destination,
				new PageRequest(page, size));
	}

}

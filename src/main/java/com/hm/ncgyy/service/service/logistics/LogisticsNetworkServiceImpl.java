package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.logistics.LogisticsNetworkEntity;
import com.hm.ncgyy.repository.service.logistics.LogisticsNetworkRepository;

@Service
public class LogisticsNetworkServiceImpl implements LogisticsNetworkService {

	@Autowired
	LogisticsNetworkRepository networkRepository;
	
	@Override
	public LogisticsNetworkEntity findOne(Long networkId) {
		return networkRepository.findOne(networkId);
	}

	@Override
	public void save(LogisticsNetworkEntity network) {
		networkRepository.save(network);
	}

	@Override
	public void delete(Long networkId) {
		networkRepository.delete(networkId);
	}

	@Override
	public void delete(List<Long> networkIds) {
		Iterable<LogisticsNetworkEntity> it = networkRepository.findByIdIn(networkIds);
		networkRepository.delete(it);
	}

	@Override
	public List<LogisticsNetworkEntity> list() {
		return (List<LogisticsNetworkEntity>) networkRepository.findAll();
	}

	@Override
	public Page<LogisticsNetworkEntity> list(int page, int size) {
		return networkRepository.findAll(new PageRequest(page, size));
	}

	@Override
	public List<LogisticsNetworkEntity> listBySupplierId(Long supplierId) {
		return networkRepository.findBySupplierId(supplierId);
	}

	@Override
	public Page<LogisticsNetworkEntity> listBySupplierId(Long supplierId, int page, int size) {
		return networkRepository.findBySupplierId(supplierId, new PageRequest(page, size));
	}

	@Override
	public Page<LogisticsNetworkEntity> search(String searchStr, int page, int size) {
		return networkRepository.findByNameContainingOrAddressContaining(searchStr, searchStr, new PageRequest(page, size));
	}

}

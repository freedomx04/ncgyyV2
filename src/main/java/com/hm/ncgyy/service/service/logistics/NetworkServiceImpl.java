package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.logistics.NetworkEntity;
import com.hm.ncgyy.repository.service.logistics.NetworkRepository;

@Service
public class NetworkServiceImpl implements NetworkService {

	@Autowired
	NetworkRepository networkRepository;

	@Override
	public NetworkEntity findOne(Long networkId) {
		return networkRepository.findOne(networkId);
	}

	@Override
	public void save(NetworkEntity network) {
		networkRepository.save(network);
	}

	@Override
	public void delete(Long networkId) {
		networkRepository.delete(networkId);
	}

	@Override
	public void delete(List<Long> networkIds) {
		Iterable<NetworkEntity> it = networkRepository.findByIdIn(networkIds);
		networkRepository.delete(it);
	}

	@Override
	public Page<NetworkEntity> list(int page, int size) {
		return networkRepository.findAll(new PageRequest(page, size));
	}

	@Override
	public List<NetworkEntity> listBySupplierId(Long supplierId) {
		return networkRepository.findBySupplierId(supplierId);
	}

	@Override
	public Page<NetworkEntity> search(String searchStr, int page, int size) {
		return networkRepository.findByNameContainingOrAddressContaining(searchStr, searchStr,
				new PageRequest(page, size));
	}

}

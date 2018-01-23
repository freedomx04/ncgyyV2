package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.logistics.NetworkEntity;

public interface NetworkService {
	
	NetworkEntity findOne(Long networkId);
	
	void save(NetworkEntity network);
	
	void delete(Long networkId);
	
	void delete(List<Long> networkIds);
	
	Page<NetworkEntity> list(int page, int size);
	
	List<NetworkEntity> listBySupplierId(Long supplierId);
	
	Page<NetworkEntity> search(String searchStr, int page, int size);

}

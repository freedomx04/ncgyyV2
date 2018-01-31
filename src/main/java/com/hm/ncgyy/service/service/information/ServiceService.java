package com.hm.ncgyy.service.service.information;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.information.ServiceEntity;

public interface ServiceService {

	ServiceEntity findOne(Long serviceId);

	void save(ServiceEntity service);

	void delete(Long serviceId);

	void delete(List<Long> serviceIds);

	List<ServiceEntity> listBySupplierId(Long supplierId);

	Page<ServiceEntity> list(int page, int size);
	
	Page<ServiceEntity> search(String searchStr, int page, int size);

}

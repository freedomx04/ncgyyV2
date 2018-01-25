package com.hm.ncgyy.service.service.information;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.information.ServiceEntity;
import com.hm.ncgyy.repository.service.information.ServiceRepository;

@Service
public class ServiceServiceImpl implements ServiceService {
	
	@Autowired
	ServiceRepository serviceRepository;

	@Override
	public ServiceEntity findOne(Long serviceId) {
		return serviceRepository.findOne(serviceId);
	}

	@Override
	public void save(ServiceEntity service) {
		serviceRepository.save(service);
	}

	@Override
	public void delete(Long serviceId) {
		serviceRepository.delete(serviceId);
	}

	@Override
	public void delete(List<Long> serviceIds) {
		Iterable<ServiceEntity> it = serviceRepository.findByIdIn(serviceIds);
		serviceRepository.delete(it);
	}

	@Override
	public List<ServiceEntity> listBySupplierId(Long supplierId) {
		return serviceRepository.findBySupplierIdOrderByUpdateTimeDesc(supplierId);
	}

	@Override
	public Page<ServiceEntity> list(int page, int size) {
		return serviceRepository.findAll(new PageRequest(page, size));
	}

}

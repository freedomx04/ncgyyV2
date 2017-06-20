package com.hm.ncgyy.service.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.base.AppealTypeEntity;
import com.hm.ncgyy.repository.base.AppealTypeRepository;

@Service
public class AppealTypeServiceImpl implements AppealTypeService {
	
	@Autowired
	AppealTypeRepository appealTypeRepository;

	@Override
	public AppealTypeEntity findOne(Long appealTypeId) {
		return appealTypeRepository.findOne(appealTypeId);
	}

	@Override
	public AppealTypeEntity findByName(String name) {
		return appealTypeRepository.findByName(name);
	}

	@Override
	public void save(AppealTypeEntity appealType) {
		appealTypeRepository.save(appealType);
	}

	@Override
	public void delete(Long appealTypeId) {
		appealTypeRepository.delete(appealTypeId);
	}

	@Override
	public List<AppealTypeEntity> list() {
		return (List<AppealTypeEntity>) appealTypeRepository.findAll();
	}

}

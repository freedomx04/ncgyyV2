package com.hm.ncgyy.service.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.repository.base.AreaRepository;

@Service
public class AreaServiceImpl implements AreaService {
	
	@Autowired
	AreaRepository areaRepository;

	@Override
	public AreaEntity findOne(Long areaId) {
		return areaRepository.findOne(areaId);
	}

	@Override
	public AreaEntity findByName(String name) {
		return areaRepository.findByName(name);
	}

	@Override
	public void save(AreaEntity area) {
		areaRepository.save(area);
	}

	@Override
	public void delete(Long areaId) {
		areaRepository.delete(areaId);
	}

	@Override
	public void delete(List<Long> areaIdList) {
		Iterable<AreaEntity> it = areaRepository.findByIdIn(areaIdList);
		areaRepository.delete(it);
	}

	@Override
	public List<AreaEntity> list() {
		return (List<AreaEntity>) areaRepository.findAll();
	}

}

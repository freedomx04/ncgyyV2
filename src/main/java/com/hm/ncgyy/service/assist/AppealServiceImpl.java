package com.hm.ncgyy.service.assist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.repository.assist.AppealRepository;

@Service
public class AppealServiceImpl implements AppealService {
	
	@Autowired
	AppealRepository appealRepository;

	@Override
	public AppealEntity findOne(Long appealId) {
		return appealRepository.findOne(appealId);
	}

	@Override
	public AppealEntity save(AppealEntity appeal) {
		return appealRepository.save(appeal);
	}

	@Override
	public void delete(Long appealId) {
		appealRepository.delete(appealId);
	}

	@Override
	public List<AppealEntity> list() {
		return appealRepository.findAllByOrderByUpdateTimeDesc();
	}

	@Override
	public List<AppealEntity> listPaging(int page, int size) {
		return null;
	}
	
	@Override
	public List<AppealEntity> findByStatus(Integer status) {
		return appealRepository.findByStatusOrderByUpdateTimeDesc(status);
	}

	@Override
	public List<AppealEntity> findByEnterpriseId(Long enterpriseId) {
		return appealRepository.findByEnterpriseIdOrderByUpdateTime(enterpriseId);
	}

	@Override
	public List<AppealEntity> findByEnterpriseIdUnconfirm(Long enterpriseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppealEntity> findByEnterpriseIdConfirmed(Long enterpriseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppealEntity> findByDepartmentId(Long departmentId) {
		return appealRepository.findByDepartmentIdOrderByUpdateTimeDesc(departmentId);
	}

	@Override
	public List<AppealEntity> findByDepartmentIdUnconfirm(Long departmentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppealEntity> findByDepartmentIdConfirmed(Long departmentId) {
		// TODO Auto-generated method stub
		return null;
	}

}

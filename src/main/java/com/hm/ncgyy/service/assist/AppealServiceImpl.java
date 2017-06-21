package com.hm.ncgyy.service.assist;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.assist.AppealEntity;

@Service
public class AppealServiceImpl implements AppealService {

	@Override
	public AppealEntity findOne(Long appealId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AppealEntity save(AppealEntity appeal) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long appealId) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<AppealEntity> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppealEntity> listPaging(int page, int size) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppealEntity> findByEnterpriseId(Long enterpriseId) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
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

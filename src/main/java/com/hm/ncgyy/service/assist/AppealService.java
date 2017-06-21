package com.hm.ncgyy.service.assist;

import java.util.List;

import com.hm.ncgyy.entity.assist.AppealEntity;

public interface AppealService {
	
	AppealEntity findOne(Long appealId);
	
	AppealEntity save(AppealEntity appeal);
	
	void delete(Long appealId);
	
	List<AppealEntity> list();
	
	List<AppealEntity> listPaging(int page, int size);
	
	/**
	 * enterprise
	 */
	List<AppealEntity> findByEnterpriseId(Long enterpriseId);
	
	List<AppealEntity> findByEnterpriseIdUnconfirm(Long enterpriseId);
	
	List<AppealEntity> findByEnterpriseIdConfirmed(Long enterpriseId);
	
	
	/**
	 * department
	 */
	List<AppealEntity> findByDepartmentId(Long departmentId);
	
	List<AppealEntity> findByDepartmentIdUnconfirm(Long departmentId);
	
	List<AppealEntity> findByDepartmentIdConfirmed(Long departmentId);
	
	
}

package com.hm.ncgyy.service.assist;

import java.math.BigInteger;
import java.util.List;

import com.hm.ncgyy.entity.assist.AppealEntity;

public interface AppealService {
	
	AppealEntity findOne(Long appealId);
	
	AppealEntity save(AppealEntity appeal);
	
	void delete(Long appealId);
	
	List<AppealEntity> list();
	
	List<AppealEntity> listPaging(int page, int size);
	
	List<AppealEntity> findByStatus(Integer status);
	
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
	

	/**
	 * others(chart)
	 */
	List<Object[]> getAppealCountByType(Long departmentId);
	
	List<AppealEntity> findByAppealTypeIdAndStatus(Long appealTypeId, Integer status, Long departmentId);
	
	List<BigInteger> getOverAcceptDays(Long departmentId, Long enterpriseId, Long appealTypeId);
	
	List<BigInteger> getOverHandleDays(Long departmentId, Long enterpriseId, Long appealTypeId);
	
}

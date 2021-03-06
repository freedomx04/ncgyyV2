package com.hm.ncgyy.service.assist;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.assist.AppealEntity;

public interface AppealService {
	
	AppealEntity findOne(Long appealId);
	
	AppealEntity save(AppealEntity appeal);
	
	void delete(Long appealId);
	
	List<AppealEntity> list(Integer status);
	
	Page<AppealEntity> listPaging(int page, int size);
	
	List<AppealEntity> findByStatus(Integer status);
	
	/**
	 * enterprise
	 */
	List<AppealEntity> findByEnterpriseId(Long enterpriseId);
	
	/**
	 * department
	 */
	List<AppealEntity> findByDepartmentId(Long departmentId);
	
	/**
	 * others(chart)
	 */
	List<Object[]> getAppealCountByType(Long departmentId);
	
	List<AppealEntity> findByAppealTypeIdAndStatus(Long appealTypeId, Integer status, Long departmentId);
	
	List<BigInteger> getOverAcceptDays(Long departmentId, Long enterpriseId, Long appealTypeId);
	
	List<BigInteger> getOverHandleDays(Long departmentId, Long enterpriseId, Long appealTypeId);
	
	List<AppealEntity> search(String input);
	
}

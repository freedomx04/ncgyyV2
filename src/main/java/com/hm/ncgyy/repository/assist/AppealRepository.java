package com.hm.ncgyy.repository.assist;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.assist.AppealEntity;

public interface AppealRepository extends PagingAndSortingRepository<AppealEntity, Long> {

	/**
	 * 获取所有
	 */
	List<AppealEntity> findAllByOrderByUpdateTimeDesc();
	
	Page<AppealEntity> findAllByOrderByUpdateTimeDesc(Pageable pageable);
	
	List<AppealEntity> findByStatusGreaterThanOrderByUpdateTimeDesc(Integer status);
	
	List<AppealEntity> findByStatusLessThanOrderByUpdateTimeDesc(Integer status);
	
	/**
	 * enterprise
	 */
	List<AppealEntity> findByEnterpriseIdOrderByUpdateTime(Long enterpriseId);
	
	List<AppealEntity> findByEnterpriseIdAndStatusGreaterThanOrderByUpdateTimeDesc(Long enterpriseId, Integer status);
	
	List<AppealEntity> findByEnterpriseIdAndStatusLessThanOrderByUpdateTimeDesc(Long enterpriseId, Integer status);
	
	
	/**
	 * department
	 */
	List<AppealEntity> findByDepartmentIdOrderByUpdateTimeDesc(Long departmentId);
	
	List<AppealEntity> findByDepartmentIdAndStatusGreaterThanOrderByUpdateTimeDesc(Long departmentId, Integer status);
	
	List<AppealEntity> findByDepartmentIdAndStatusLessThanOrderByUpdateTimeDesc(Long departmentId, Integer status);
	
}

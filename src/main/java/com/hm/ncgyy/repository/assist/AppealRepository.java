package com.hm.ncgyy.repository.assist;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.assist.AppealEntity;

public interface AppealRepository extends PagingAndSortingRepository<AppealEntity, Long> {

	/**
	 * 获取所有
	 */
	List<AppealEntity> findAllByStatusNotOrderByUpdateTimeDesc(Integer status);
	
	Page<AppealEntity> findAllByOrderByUpdateTimeDesc(Pageable pageable);
	
	List<AppealEntity> findByStatusOrderByUpdateTimeDesc(Integer status);
	
	List<AppealEntity> findByStatusGreaterThanOrderByUpdateTimeDesc(Integer status);
	
	List<AppealEntity> findByStatusLessThanOrderByUpdateTimeDesc(Integer status);
	
	/**
	 * enterprise
	 */
	List<AppealEntity> findByEnterpriseIdOrderByUpdateTimeDesc(Long enterpriseId);
	
	List<AppealEntity> findByEnterpriseIdAndStatusGreaterThanOrderByUpdateTimeDesc(Long enterpriseId, Integer status);
	
	List<AppealEntity> findByEnterpriseIdAndStatusLessThanOrderByUpdateTimeDesc(Long enterpriseId, Integer status);
	
	
	/**
	 * department
	 */
	List<AppealEntity> findByDepartmentIdOrderByUpdateTimeDesc(Long departmentId);
	
	List<AppealEntity> findByDepartmentIdAndStatusGreaterThanOrderByUpdateTimeDesc(Long departmentId, Integer status);
	
	List<AppealEntity> findByDepartmentIdAndStatusLessThanOrderByUpdateTimeDesc(Long departmentId, Integer status);
	
	/**
	 * others
	 */
	@Query(value = "select ap.appeal_type_id, bap.name, count(*) from assist_appeal ap, base_appeal_type bap "
			+ "where ap.appeal_type_id = bap.id and ap.status <>0 group by ap.appeal_type_id, bap.name", nativeQuery = true)
	List<Object[]> getAppealCountByType();

	@Query(value = "select ap.appeal_type_id, bap.name, count(*) from assist_appeal ap, base_appeal_type bap "
			+ "where ap.appeal_type_id = bap.id and ap.status <>0 and ap.department_id = ?1 "
			+ "group by ap.appeal_type_id, bap.name", nativeQuery = true)
	List<Object[]> getAppealCountByType(Long departmentId);
	
	List<AppealEntity> findByAppealTypeIdAndStatusOrderByCreateTimeDesc(Long appealTypeId, Integer status);

	List<AppealEntity> findByAppealTypeIdAndStatusAndDepartmentIdOrderByCreateTimeDesc(Long appealTypeId,
			Integer status, Long departmentId);
	
	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and apt.id = ?1 and ap.status=2", nativeQuery = true)
	List<BigInteger> getOverAcceptDays(Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and apt.id = ?2 and ap.department_id = ?1 and ap.status=2", nativeQuery = true)
	List<BigInteger> getOverAcceptDaysByDepartmentId(Long departmentId, Long appealTypeId);
	
	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and apt.id = ?2 and ap.enterprise_id = ?1 and ap.status=2", nativeQuery = true)
	List<BigInteger> getOverAcceptDaysByEnterpriseId(Long enterpriseId, Long appealTypeId);
	
	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null and apt.id = ?1 and ap.status=3", nativeQuery = true)
	List<BigInteger> getOverHandleDays(Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null and apt.id = ?2 and ap.enterprise_id = ?1 and ap.status=3", nativeQuery = true)
	List<BigInteger> getOverHandleDaysByEnterpriseId(Long enterpriseId, Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null and apt.id = ?2 and ap.department_id = ?1 and ap.status=3", nativeQuery = true)
	List<BigInteger> getOverHandleDaysByDepartmentId(Long departmentId, Long appealTypeId);
	
	List<AppealEntity> findByTitleContaining(String title);
}

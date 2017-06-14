package com.hm.ncgyy.repository.monitor;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.monitor.TargetEntity;

public interface TargetRepository extends CrudRepository<TargetEntity, Long> {
	
	Iterable<TargetEntity> findByIdIn(List<Long> targetIds);
	
	Iterable<TargetEntity> findByEnterpriseId(Long enterpriseId);

	List<TargetEntity> findByMonthly(String monthly);

	Page<TargetEntity> findByMonthly(String monthly, Pageable pageable);

	List<TargetEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId);

	Page<TargetEntity> findByEnterpriseIdOrderByMonthlyAsc(Long enterpriseId, Pageable pageable);

	TargetEntity findByMonthlyAndEnterpriseId(String monthly, Long enterpriseId);

	List<TargetEntity> findByMonthlyAndEnterpriseIn(String monthly, List<EnterpriseBaseEntity> list);
	
	List<TargetEntity> findByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId);

}

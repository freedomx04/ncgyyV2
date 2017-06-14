package com.hm.ncgyy.service.monitor;

import java.util.List;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.monitor.TargetEntity;

public interface TargetService {
	
	TargetEntity findOne(Long targetId);
	
	TargetEntity findOne(String monthly, Long enterpriseId);
	
	void save(TargetEntity target);
	
	void delete(Long targetId);
	
	void delete(List<Long> targetIds);
	
	List<TargetEntity> list(String monthly);
	
	List<TargetEntity> list(String monthly, int page, int size);
	
	List<TargetEntity> list(Long enterpriseId);
	
	List<TargetEntity> list(Long enterpriseId, int page, int size);
	
	List<TargetEntity> listByMonthlyAndEnterpriseIn(String monthly, List<EnterpriseBaseEntity> list);
	
	List<TargetEntity> listByMonthlyInAndEnterpriseId(List<String> monthlyList, Long enterpriseId);
	
	TargetVO detail(TargetEntity target);
	
	TargetVO detail(String monthly, EnterpriseBaseEntity enterprise);
	
	TargetVO sumEnterpriseTarget(String monthly, List<EnterpriseBaseEntity> enterpriseList);
	
}

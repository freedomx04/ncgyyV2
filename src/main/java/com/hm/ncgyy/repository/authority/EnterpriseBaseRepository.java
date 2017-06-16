package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;

public interface EnterpriseBaseRepository extends PagingAndSortingRepository<EnterpriseBaseEntity, Long> {
	
	EnterpriseBaseEntity findByName(String name);
	
	List<EnterpriseBaseEntity> findByAreaId(Long areaId);
	
	List<EnterpriseBaseEntity> findByIndustryId(Long industryId);
	
	List<EnterpriseBaseEntity> findByPointStatus(Integer pointStatus);

}

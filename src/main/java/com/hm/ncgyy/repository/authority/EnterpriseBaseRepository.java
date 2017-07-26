package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;

public interface EnterpriseBaseRepository extends PagingAndSortingRepository<EnterpriseBaseEntity, Long> {
	
	EnterpriseBaseEntity findByName(String name);
	
	List<EnterpriseBaseEntity> findByAreaId(Long areaId);
	
	List<EnterpriseBaseEntity> findByIndustryId(Long industryId);
	
	List<EnterpriseBaseEntity> findByPointStatus(Integer pointStatus);
	
	Page<EnterpriseBaseEntity> findAll(Pageable pageable);
	
	List<EnterpriseEntity> findByNameContaining(String name);

}

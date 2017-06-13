package com.hm.ncgyy.repository.authority;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.authority.EnterpriseEntity;

public interface EnterpriseRepository extends PagingAndSortingRepository<EnterpriseEntity, Long> {
	
	EnterpriseEntity findByName(String name);

}

package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.authority.EnterpriseEntity;

public interface EnterpriseRepository extends PagingAndSortingRepository<EnterpriseEntity, Long> {
	
	EnterpriseEntity findByName(String name);
	
	List<EnterpriseEntity> findByNameContaining(String name);
	
	Page<EnterpriseEntity> findByNameContaining(String name, Pageable pageable);

}

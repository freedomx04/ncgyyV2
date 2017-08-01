package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.VersionEntity;

public interface VersionRepository extends CrudRepository<VersionEntity, Long> {
	
	Iterable<VersionEntity> findByIdIn(List<Long> versionIdList);
	
	VersionEntity findByCode(String code);
	
	List<VersionEntity> findByOrderByCodeDesc();
	
	Page<VersionEntity> findByOrderByCodeDesc(Pageable pageable);
	
	VersionEntity findFirstByOrderByCodeDesc();

}

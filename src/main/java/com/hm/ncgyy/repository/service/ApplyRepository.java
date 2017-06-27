package com.hm.ncgyy.repository.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.ApplyEntity;

public interface ApplyRepository extends PagingAndSortingRepository<ApplyEntity, Long> {

	Iterable<ApplyEntity> findByIdIn(List<Long> declareApplyIds);
	
	ApplyEntity findByDeclareIdAndEnterpriseId(Long declareId, Long enterpriseId);

	List<ApplyEntity> findByEnterpriseId(Long enterpriseId);

	Page<ApplyEntity> findByEnterpriseId(Long enterpriseId, Pageable pageable);

}

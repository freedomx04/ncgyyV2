package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.authority.DemandEntity;

public interface DemandRepository extends PagingAndSortingRepository<DemandEntity, Long> {
	
	Iterable<DemandEntity> findByIdIn(List<Long> demandIdList);

	List<DemandEntity> findByEnterpriseIdOrderByUpdateTimeDesc(Long enterpriseId);
	
	Page<DemandEntity> findByEnterpriseIdOrderByUpdateTimeDesc(Long enterpriseId, Pageable pageable);
	
	Page<DemandEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

}

package com.hm.ncgyy.repository.service.information;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.information.DemandEntity;

public interface DemandRepository extends PagingAndSortingRepository<DemandEntity, Long> {
	
	Iterable<DemandEntity> findByIdIn(List<Long> demandIdList);

	List<DemandEntity> findByUserIdOrderByUpdateTimeDesc(Long userId);
	
	Page<DemandEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

}

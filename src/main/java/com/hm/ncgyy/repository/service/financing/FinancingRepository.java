package com.hm.ncgyy.repository.service.financing;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.financing.FinancingEntity;

public interface FinancingRepository extends PagingAndSortingRepository<FinancingEntity, Long> {

	Iterable<FinancingEntity> findByIdIn(List<Long> financingIds);

	List<FinancingEntity> findByOrderByUpdateTimeDesc();

	Page<FinancingEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

	List<FinancingEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId);

	Page<FinancingEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId, Pageable pageable);

	Page<FinancingEntity> findByTitleContaining(String title, Pageable pageable);

	Page<FinancingEntity> findByProfessionInAndFinancingTypeIn(List<Integer> profession, List<Integer> financingType,
			Pageable pageable);

}

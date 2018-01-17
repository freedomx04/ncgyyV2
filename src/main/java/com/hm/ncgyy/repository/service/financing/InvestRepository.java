package com.hm.ncgyy.repository.service.financing;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.financing.InvestEntity;

public interface InvestRepository extends PagingAndSortingRepository<InvestEntity, Long> {

	Iterable<InvestEntity> findByIdIn(List<Long> investIds);

	List<InvestEntity> findByOrderByUpdateTimeDesc();

	Page<InvestEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

	List<InvestEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId);

	Page<InvestEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId, Pageable pageable);

	Page<InvestEntity> findByTitleContaining(String title, Pageable pageable);

	Page<InvestEntity> findByInvestTypeInAndFundTypeIn(List<Integer> investType, List<Integer> fundType,
			Pageable pageable);

}

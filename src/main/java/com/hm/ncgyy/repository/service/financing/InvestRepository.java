package com.hm.ncgyy.repository.service.financing;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.financing.InvestEntity;

public interface InvestRepository extends PagingAndSortingRepository<InvestEntity, Long> {

	Iterable<InvestEntity> findByIdIn(List<Long> investIds);

	Page<InvestEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

	List<InvestEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId);

	Page<InvestEntity> findByTitleContainingOrderByUpdateTimeDesc(String title, Pageable pageable);

	Page<InvestEntity> findByProfessionInAndInvestTypeInAndFundTypeInOrderByUpdateTimeDesc(List<String> profession,
			List<String> investType, List<String> fundType, Pageable pageable);

}

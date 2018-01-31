package com.hm.ncgyy.repository.service.talent;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.service.talent.RecruitEntity;

public interface RecruitRepository extends PagingAndSortingRepository<RecruitEntity, Long> {

	Iterable<RecruitEntity> findByIdIn(List<Long> recruitIds);

	Page<RecruitEntity> findByOrderByUpdateTimeDesc(Pageable pageable);

	List<RecruitEntity> findBySupplierIdOrderByUpdateTimeDesc(Long supplierId);

	Page<RecruitEntity> findByPositionContainingOrderByUpdateTimeDesc(String position, Pageable pageable);

	Page<RecruitEntity> findByProfessionInAndEducationInAndWorkingYearsInAndSalaryInOrderByUpdateTimeDesc(List<String> profession,
			List<String> education, List<String> workingYears, List<String> salary, Pageable pageable);

}

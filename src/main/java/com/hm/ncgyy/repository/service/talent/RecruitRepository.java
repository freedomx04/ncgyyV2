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

	Page<RecruitEntity> findByProfessionInAndEducationInAndWorkingYearsInAndSalaryIn(List<Integer> profession,
			List<Integer> education, List<Integer> workingYears, List<Integer> salary, Pageable pageable);

}

package com.hm.ncgyy.service.service.talent;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.talent.RecruitEntity;

public interface RecruitService {

	RecruitEntity findOne(Long recruitId);

	void save(RecruitEntity recruit);

	void delete(Long recruitId);

	void delete(List<Long> recruitIds);

	Page<RecruitEntity> list(int page, int size);

	List<RecruitEntity> listBySupplierId(Long supplierId);

	Page<RecruitEntity> search(String searchStr, int page, int size);

	Page<RecruitEntity> filter(String profession, String education, String workingYears, String salary, int page,
			int size);

}

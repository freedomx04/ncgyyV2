package com.hm.ncgyy.service.service.talent;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.talent.RecruitEntity;
import com.hm.ncgyy.repository.service.talent.RecruitRepository;

@Service
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	RecruitRepository recruitRepository;

	@Override
	public RecruitEntity findOne(Long recruitId) {
		return recruitRepository.findOne(recruitId);
	}

	@Override
	public void save(RecruitEntity recruit) {
		recruitRepository.save(recruit);
	}

	@Override
	public void delete(Long recruitId) {
		recruitRepository.delete(recruitId);
	}

	@Override
	public void delete(List<Long> recruitIds) {
		Iterable<RecruitEntity> it = recruitRepository.findByIdIn(recruitIds);
		recruitRepository.delete(it);
	}

	@Override
	public Page<RecruitEntity> list(int page, int size) {
		return recruitRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public List<RecruitEntity> listBySupplierId(Long supplierId) {
		return recruitRepository.findBySupplierIdOrderByUpdateTimeDesc(supplierId);
	}

	@Override
	public Page<RecruitEntity> search(String searchStr, int page, int size) {
		return recruitRepository.findByPositionContainingOrderByUpdateTimeDesc(searchStr, new PageRequest(page, size));
	}

	@Override
	public Page<RecruitEntity> filter(String profession, String education, String workingYears, String salary, int page,
			int size) {
		List<Integer> prlist = new LinkedList<>();
		for (String pr : StringUtils.split(profession, '-')) {
			prlist.add(Integer.parseInt(pr));
		}

		List<Integer> edlist = new LinkedList<>();
		for (String ed : StringUtils.split(education, '-')) {
			edlist.add(Integer.parseInt(ed));
		}

		List<Integer> wylist = new LinkedList<>();
		for (String wy : StringUtils.split(workingYears, '-')) {
			wylist.add(Integer.parseInt(wy));
		}

		List<Integer> salist = new LinkedList<>();
		for (String sa : StringUtils.split(salary, '-')) {
			salist.add(Integer.parseInt(sa));
		}

		return recruitRepository.findByProfessionInAndEducationInAndWorkingYearsInAndSalaryIn(prlist, edlist,
				wylist, salist, new PageRequest(page, size));
	}

}

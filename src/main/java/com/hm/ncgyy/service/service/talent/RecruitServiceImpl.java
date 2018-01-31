package com.hm.ncgyy.service.service.talent;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.common.utils.ConstantUtil;
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
		List<String> prlist = new LinkedList<>();
		if (StringUtils.isEmpty(profession)) {
			for (String pr : ConstantUtil.professions) {
				prlist.add(pr);
			}
		} else {
			for (String pr : StringUtils.split(profession, ',')) {
				prlist.add(pr);
			}
		}

		List<String> edlist = new LinkedList<>();
		if (StringUtils.isEmpty(education)) {
			for (String ed : ConstantUtil.educations) {
				edlist.add(ed);
			}
		} else {
			for (String ed : StringUtils.split(education, ',')) {
				edlist.add(ed);
			}
		}

		List<String> wylist = new LinkedList<>();
		if (StringUtils.isEmpty(workingYears)) {
			for (String wy : ConstantUtil.workingYearss) {
				wylist.add(wy);
			}
		} else {
			for (String wy : StringUtils.split(workingYears, ',')) {
				wylist.add(wy);
			}
		}

		List<String> salist = new LinkedList<>();
		if (StringUtils.isEmpty(salary)) {
			for (String sa : ConstantUtil.salarys) {
				salist.add(sa);
			}
		} else {
			for (String sa : StringUtils.split(salary, ',')) {
				salist.add(sa);
			}
		}

		return recruitRepository.findByProfessionInAndEducationInAndWorkingYearsInAndSalaryInOrderByUpdateTimeDesc(
				prlist, edlist, wylist, salist, new PageRequest(page, size));
	}

}

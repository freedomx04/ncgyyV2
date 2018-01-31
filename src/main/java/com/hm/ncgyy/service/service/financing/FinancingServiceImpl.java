package com.hm.ncgyy.service.service.financing;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.common.utils.ConstantUtil;
import com.hm.ncgyy.entity.service.financing.FinancingEntity;
import com.hm.ncgyy.repository.service.financing.FinancingRepository;

@Service
public class FinancingServiceImpl implements FinancingService {

	@Autowired
	FinancingRepository financingRepository;

	@Override
	public FinancingEntity findOne(Long financingId) {
		return financingRepository.findOne(financingId);
	}

	@Override
	public void save(FinancingEntity financing) {
		financingRepository.save(financing);
	}

	@Override
	public void delete(Long financingId) {
		financingRepository.delete(financingId);
	}

	@Override
	public void delete(List<Long> financingIds) {
		Iterable<FinancingEntity> it = financingRepository.findByIdIn(financingIds);
		financingRepository.delete(it);
	}

	@Override
	public List<FinancingEntity> listBySupplierId(Long supplierId) {
		return financingRepository.findBySupplierIdOrderByUpdateTimeDesc(supplierId);
	}

	@Override
	public Page<FinancingEntity> list(int page, int size) {
		return financingRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public Page<FinancingEntity> search(String searchStr, int page, int size) {
		return financingRepository.findByTitleContainingOrderByUpdateTimeDesc(searchStr, new PageRequest(page, size));
	}

	@Override
	public Page<FinancingEntity> filter(String profession, String financingType, int page, int size) {
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

		List<String> ftlist = new LinkedList<>();
		if (StringUtils.isEmpty(financingType)) {
			for (String ft : ConstantUtil.financingTypes) {
				ftlist.add(ft);
			}
		} else {
			for (String ft : StringUtils.split(financingType, ",")) {
				ftlist.add(ft);
			}
		}

		return financingRepository.findByProfessionInAndFinancingTypeInOrderByUpdateTimeDesc(prlist, ftlist,
				new PageRequest(page, size));
	}

}

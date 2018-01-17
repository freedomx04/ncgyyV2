package com.hm.ncgyy.service.service.financing;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.service.financing.InvestEntity;
import com.hm.ncgyy.repository.service.financing.InvestRepository;

@Service
public class InvestServiceImpl implements InvestService {
	
	@Autowired
	InvestRepository investRepository;

	@Override
	public InvestEntity findOne(Long investId) {
		return investRepository.findOne(investId);
	}

	@Override
	public void save(InvestEntity invest) {
		investRepository.save(invest);
	}

	@Override
	public void delete(Long investId) {
		investRepository.delete(investId);
	}

	@Override
	public void delete(List<Long> investIds) {
		Iterable<InvestEntity> it = investRepository.findByIdIn(investIds);
		investRepository.delete(it);
	}

	@Override
	public Page<InvestEntity> list(int page, int size) {
		return investRepository.findByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}

	@Override
	public List<InvestEntity> listBySupplierId(Long supplierId) {
		return investRepository.findBySupplierIdOrderByUpdateTimeDesc(supplierId);
	}

	@Override
	public Page<InvestEntity> search(String searchStr, int page, int size) {
		return investRepository.findByTitleContaining(searchStr, new PageRequest(page, size));
	}

	@Override
	public Page<InvestEntity> filter(String investType, String fundType, int page, int size) {
		List<Integer> itlist = new LinkedList<>();
		for (String it: StringUtils.split(investType, '-')) {
			itlist.add(Integer.parseInt(it));
		}
		
		List<Integer> ftlist = new LinkedList<>();
		for (String ft: StringUtils.split(fundType, '-')) {
			ftlist.add(Integer.parseInt(ft));
		}
		
		return investRepository.findByInvestTypeInAndFundTypeIn(itlist, ftlist, new PageRequest(page, size));
	}

}

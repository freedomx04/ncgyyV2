package com.hm.ncgyy.service.assist;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.repository.assist.AppealRepository;

@Service
public class AppealServiceImpl implements AppealService {
	
	@Autowired
	AppealRepository appealRepository;

	@Override
	public AppealEntity findOne(Long appealId) {
		return appealRepository.findOne(appealId);
	}

	@Override
	public AppealEntity save(AppealEntity appeal) {
		return appealRepository.save(appeal);
	}

	@Override
	public void delete(Long appealId) {
		appealRepository.delete(appealId);
	}

	@Override
	public List<AppealEntity> list(Integer status) {
		return appealRepository.findAllByStatusNotOrderByUpdateTimeDesc(status);
	}
	
	@Override
	public Page<AppealEntity> listPaging(int page, int size) {
		return appealRepository.findAllByOrderByUpdateTimeDesc(new PageRequest(page, size));
	}
	
	@Override
	public List<AppealEntity> findByStatus(Integer status) {
		return appealRepository.findByStatusOrderByUpdateTimeDesc(status);
	}

	@Override
	public List<AppealEntity> findByEnterpriseId(Long enterpriseId) {
		return appealRepository.findByEnterpriseIdOrderByUpdateTimeDesc(enterpriseId);
	}

	@Override
	public List<AppealEntity> findByEnterpriseIdUnconfirm(Long enterpriseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppealEntity> findByEnterpriseIdConfirmed(Long enterpriseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppealEntity> findByDepartmentId(Long departmentId) {
		return appealRepository.findByDepartmentIdOrderByUpdateTimeDesc(departmentId);
	}

	@Override
	public List<AppealEntity> findByDepartmentIdUnconfirm(Long departmentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppealEntity> findByDepartmentIdConfirmed(Long departmentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object[]> getAppealCountByType(Long departmentId) {
		if (departmentId == null || "".equals(departmentId)) {
			return appealRepository.getAppealCountByType();
		} else {
			return appealRepository.getAppealCountByType(departmentId);
		}
	}
	
	@Override
	public List<AppealEntity> findByAppealTypeIdAndStatus(Long appealTypeId, Integer status, Long departmentId) {
		if (departmentId == null || "".equals(departmentId)) {
			return appealRepository.findByAppealTypeIdAndStatusOrderByCreateTimeDesc(appealTypeId, status);
		} else {
			return appealRepository.findByAppealTypeIdAndStatusAndDepartmentIdOrderByCreateTimeDesc(appealTypeId,
					status, departmentId);
		}
	}
	
	@Override
	public List<BigInteger> getOverAcceptDays(Long departmentId, Long enterpriseId, Long appealTypeId) {
		if ((departmentId == null || "".equals(departmentId)) && enterpriseId == null || "".equals(enterpriseId)) {
			return appealRepository.getOverAcceptDays(appealTypeId);
		} else if (departmentId != null && !"".equals(departmentId)) {
			return appealRepository.getOverAcceptDaysByDepartmentId(departmentId, appealTypeId);
		} else {
			return appealRepository.getOverAcceptDaysByEnterpriseId(enterpriseId, appealTypeId);
		}
	}

	@Override
	public List<BigInteger> getOverHandleDays(Long departmentId, Long enterpriseId, Long appealTypeId) {
		if ((departmentId == null || "".equals(departmentId)) && enterpriseId == null || "".equals(enterpriseId)) {
			return appealRepository.getOverHandleDays(appealTypeId);
		} else if (departmentId != null && !"".equals(departmentId)) {
			return appealRepository.getOverHandleDaysByDepartmentId(departmentId, appealTypeId);
		} else {
			return appealRepository.getOverHandleDaysByEnterpriseId(enterpriseId, appealTypeId);
		}
	}
	
	@Override
	public List<AppealEntity> search(String input) {
		return appealRepository.findByTitleContaining(input);
	}
}

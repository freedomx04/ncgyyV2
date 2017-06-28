package com.hm.ncgyy.service.service;

import java.util.List;

import com.hm.ncgyy.entity.service.ApplyEntity;

public interface ApplyService {
	
	ApplyEntity findOne(Long applyId);
	
	ApplyEntity findOne(Long declareId, Long enterpriseId);

	void save(ApplyEntity apply);

	void delete(Long applyId);
	
	void delete(List<Long> applyIdList);
	
	List<ApplyEntity> list(Long enterpriseId);
	
	List<ApplyEntity> listByDeclareId(Long declareId);
	
}

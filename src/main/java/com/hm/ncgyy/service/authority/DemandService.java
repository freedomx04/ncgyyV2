package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.authority.DemandEntity;

public interface DemandService {
	
	DemandEntity findOne(Long demandId);
	
	void save(DemandEntity demand);
	
	void delete(Long demandId);
	
	void delete(List<Long> demandIds);
	
	List<DemandEntity> listByEnterpriseId(Long enterpriseId);
	
	Page<DemandEntity> list(int page, int size);

}

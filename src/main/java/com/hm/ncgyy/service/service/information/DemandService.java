package com.hm.ncgyy.service.service.information;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.information.DemandEntity;

public interface DemandService {
	
	DemandEntity findOne(Long demandId);
	
	void save(DemandEntity demand);
	
	void delete(Long demandId);
	
	void delete(List<Long> demandIds);
	
	List<DemandEntity> listByUserId(Long userId);
	
	Page<DemandEntity> list(int page, int size);
	
	Page<DemandEntity> search(String searchStr, int page, int size);

}

package com.hm.ncgyy.service.website;

import java.util.List;

import com.hm.ncgyy.entity.website.ParallelApproveEntity;

public interface ParallelApproveService {
	
	ParallelApproveEntity findOne(Long approveId);
	
	void save(ParallelApproveEntity approve);
	
	void delete(Long approveId);
	
	void delete(List<Long> approveIds);
	
	List<ParallelApproveEntity> list();

}

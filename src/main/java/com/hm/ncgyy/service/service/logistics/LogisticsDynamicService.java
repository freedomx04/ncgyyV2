package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.logistics.LogisticsDynamicEntity;

public interface LogisticsDynamicService {
	
	LogisticsDynamicEntity findOne(Long dynamicId);
	
	void save(LogisticsDynamicEntity dynamic);
	
	void delete(Long dynamicId);
	
	void delete(List<Long> dynamicIds);
	
	List<LogisticsDynamicEntity> list();
	
	Page<LogisticsDynamicEntity> list(int page, int size);
	
	List<LogisticsDynamicEntity> listBySupplierId(Long supplierId);
	
	Page<LogisticsDynamicEntity> listBySupplierId(Long supplierId, int page, int size);

}

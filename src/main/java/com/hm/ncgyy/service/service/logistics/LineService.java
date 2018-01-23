package com.hm.ncgyy.service.service.logistics;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.service.logistics.LineEntity;

public interface LineService {
	
	LineEntity findOne(Long lineId);
	
	void save(LineEntity line);
	
	void delete(Long lineId);
	
	void delete(List<Long> lineIds);
	
	Page<LineEntity> list(int page, int size);
	
	List<LineEntity> listBySupplierId(Long supplierId);
	
	Page<LineEntity> search(String origin, String destination, int page, int size);
	
}

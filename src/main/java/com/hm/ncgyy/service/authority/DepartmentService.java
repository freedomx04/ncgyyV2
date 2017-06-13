package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.DepartmentEntity;

public interface DepartmentService {
	
	DepartmentEntity findOne(Long departmentId);
	
	DepartmentEntity findByName(String name);
	
	void save(DepartmentEntity department);
	
	void delete(Long departmentId);
	
	List<DepartmentEntity> list();

}

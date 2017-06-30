package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.DepartmentEntity;

public interface DepartmentRepository extends CrudRepository<DepartmentEntity, Long> {
	
	Iterable<DepartmentEntity> findByIdIn(List<Long> departmentIdList);
	
	DepartmentEntity findByName(String name);

}

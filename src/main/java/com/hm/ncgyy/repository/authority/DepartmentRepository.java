package com.hm.ncgyy.repository.authority;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.DepartmentEntity;

public interface DepartmentRepository extends CrudRepository<DepartmentEntity, Long> {
	
	DepartmentEntity findByName(String name);

}

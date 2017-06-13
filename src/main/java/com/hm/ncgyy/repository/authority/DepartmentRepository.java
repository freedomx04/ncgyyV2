package com.hm.ncgyy.repository.authority;

import org.springframework.data.repository.CrudRepository;

public interface DepartmentRepository extends CrudRepository<DepartmentEntity, Long> {
	
	DepartmentEntity findByName(String name);

}

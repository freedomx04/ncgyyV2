package com.hm.ncgyy.repository.authority;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.RoleEntity;

public interface RoleRepository extends CrudRepository<RoleEntity, Long> {
	
	RoleEntity findByName(String name);

}

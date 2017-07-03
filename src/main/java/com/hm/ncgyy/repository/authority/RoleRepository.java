package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.RoleEntity;

public interface RoleRepository extends CrudRepository<RoleEntity, Long> {
	
	Iterable<RoleEntity> findByIdIn(List<Long> roleIdList);
	
	RoleEntity findByName(String name);

}

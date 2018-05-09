package com.hm.ncgyy.repository.authority;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.ConfigEntity;

public interface ConfigRepository extends CrudRepository<ConfigEntity, Long> {

	ConfigEntity findByName(String name);
	
}

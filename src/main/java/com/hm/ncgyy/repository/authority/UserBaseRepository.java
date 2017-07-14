package com.hm.ncgyy.repository.authority;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.UserBaseEntity;

public interface UserBaseRepository extends CrudRepository<UserBaseEntity, Long> {
	
	UserBaseEntity findByUsername(String username);

}

package com.hm.ncgyy.repository.authority;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.UserEntity;

public interface UserRepository extends CrudRepository<UserEntity, Long> {
	
	UserEntity findByUsername(String username);
	
	UserEntity findByWxUserId(String wxUserId);
	
	UserEntity findByMobile(String mobile);
	
	UserEntity findByEmail(String email);

}

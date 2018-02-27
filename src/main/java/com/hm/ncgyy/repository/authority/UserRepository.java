package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.UserEntity;

public interface UserRepository extends CrudRepository<UserEntity, Long> {
	
	UserEntity findByUsername(String username);
	
	UserEntity findByWxUserId(String wxUserId);
	
	UserEntity findByMobile(String mobile);
	
	UserEntity findByEmail(String email);
	
	List<UserEntity> findByRoleId(Long roleId);

}

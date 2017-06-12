package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.UserEntity;

public interface UserService {
	
	UserEntity findOne(Long userId);
	
	UserEntity findByUsername(String username);
	
	void save(UserEntity user);
	
	void delete(Long userId);
	
	List<UserEntity> list();
	
	UserEntity findByWxUserId(String wxUserId);
}

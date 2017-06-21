package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.authority.UserEntity;

public interface UserService {
	
	UserEntity findOne(Long userId);
	
	UserEntity findByUsername(String username);
	
	UserEntity findByWxUserId(String wxUserId);
	
	UserEntity findByMobile(String mobile);
	
	UserEntity findByEmail(String email);
	
	void save(UserEntity user);
	
	void delete(Long userId);
	
	List<UserEntity> list();
	
	UserBaseEntity findOneBase(Long userId);
	
	
}

package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.LoginEntity;

public interface LoginService {
	
	LoginEntity findOne(Long loginId);
	
	void save(LoginEntity login);
	
	List<LoginEntity> listByUserIdOrderByCreateTime(Long userId);

}

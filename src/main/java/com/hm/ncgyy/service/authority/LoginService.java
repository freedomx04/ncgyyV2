package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.authority.LoginEntity;

public interface LoginService {
	
	LoginEntity findOne(Long loginId);
	
	void save(LoginEntity login);
	
	List<LoginEntity> listByUserId(Long userId);
	
	Page<LoginEntity> listByUserId(Long userId, int page, int size);

}

package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.LoginEntity;
import com.hm.ncgyy.repository.authority.LoginRepository;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginRepository loginRepository;
	
	@Override
	public LoginEntity findOne(Long loginId) {
		return loginRepository.findOne(loginId);
	}

	@Override
	public void save(LoginEntity login) {
		loginRepository.save(login);
	}

	@Override
	public List<LoginEntity> listByUserId(Long userId) {
		return loginRepository.findByUserIdOrderByCreateTimeDesc(userId);
	}

	@Override
	public Page<LoginEntity> listByUserId(Long userId, int page, int size) {
		return loginRepository.findByUserIdOrderByCreateTimeDesc(userId, new PageRequest(page, size));
	}

}

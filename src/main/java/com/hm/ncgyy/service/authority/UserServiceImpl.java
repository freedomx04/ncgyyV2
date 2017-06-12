package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.repository.authority.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;

	@Override
	public UserEntity findOne(Long userId) {
		return userRepository.findOne(userId);
	}

	@Override
	public UserEntity findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public void save(UserEntity user) {
		userRepository.save(user);
	}

	@Override
	public void delete(Long userId) {
		userRepository.delete(userId);
	}

	@Override
	public List<UserEntity> list() {
		return (List<UserEntity>) userRepository.findAll();
	}

	@Override
	public UserEntity findByWxUserId(String wxUserId) {
		return userRepository.findByWxUserId(wxUserId);
	}

}

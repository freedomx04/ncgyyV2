package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.repository.authority.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleRepository roleRepository;

	@Override
	public RoleEntity findOne(Long roleId) {
		return roleRepository.findOne(roleId);
	}

	@Override
	public RoleEntity findByName(String name) {
		return roleRepository.findByName(name);
	}

	@Override
	public RoleEntity save(RoleEntity role) {
		return roleRepository.save(role);
	}

	@Override
	public void delete(Long roleId) {
		roleRepository.delete(roleId);
	}
	
	@Override
	public void delete(List<Long> roleIdList) {
		Iterable<RoleEntity> it = roleRepository.findByIdIn(roleIdList);
		roleRepository.delete(it);
	}

	@Override
	public List<RoleEntity> list() {
		return (List<RoleEntity>) roleRepository.findAll();
	}

}

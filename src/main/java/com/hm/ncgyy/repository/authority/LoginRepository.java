package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.authority.LoginEntity;

public interface LoginRepository extends CrudRepository<LoginEntity, Long> {
	
	List<LoginEntity> findByUserIdOrderByCreateTime(Long userId);

}

package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.authority.LoginEntity;

public interface LoginRepository extends PagingAndSortingRepository<LoginEntity, Long> {
	
	List<LoginEntity> findByUserIdOrderByCreateTimeDesc(Long userId);
	
	Page<LoginEntity> findByUserIdOrderByCreateTimeDesc(Long userId, Pageable pageable);

}

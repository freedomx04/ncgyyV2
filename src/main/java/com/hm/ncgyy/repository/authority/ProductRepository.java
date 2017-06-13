package com.hm.ncgyy.repository.authority;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.authority.ProductEntity;

public interface ProductRepository extends PagingAndSortingRepository<ProductEntity, Long> {
	
	List<ProductEntity> findByEnterpriseId(Long enterpriseId);
	
	Page<ProductEntity> findByEnterpriseId(Long enterpriseId, Pageable pageable);
	
	List<ProductEntity> findByNameContaining(String name);

}

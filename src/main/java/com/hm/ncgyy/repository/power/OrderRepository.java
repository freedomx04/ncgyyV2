package com.hm.ncgyy.repository.power;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.hm.ncgyy.entity.power.OrderEntity;

public interface OrderRepository extends PagingAndSortingRepository<OrderEntity, Long> {
	
	List<OrderEntity> findByOrderByUpdateTimeDesc();
	
	List<OrderEntity> findByEnterpriseIdOrderByUpdateTimeDesc(Long enterpriseId);

}

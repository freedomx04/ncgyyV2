package com.hm.ncgyy.service.power;

import java.util.List;

import com.hm.ncgyy.entity.power.OrderEntity;

public interface OrderService {
	
	OrderEntity findOne(Long orderId);
	
	void save(OrderEntity order);
	
	void delete(Long orderId);
	
	List<OrderEntity> list();
	
	List<OrderEntity> listByStatus(Integer status);
	
	/**
	 * enterprise
	 */
	List<OrderEntity> listByEnterpriseId(Long enterpriseId);

}

package com.hm.ncgyy.service.power;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.power.OrderEntity;
import com.hm.ncgyy.repository.power.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderRepository orderRepository;

	@Override
	public OrderEntity findOne(Long orderId) {
		return orderRepository.findOne(orderId);
	}

	@Override
	public void save(OrderEntity order) {
		orderRepository.save(order);
	}

	@Override
	public void delete(Long orderId) {
		orderRepository.delete(orderId);
	}

	@Override
	public List<OrderEntity> list() {
		return orderRepository.findByOrderByUpdateTimeDesc();
	}

	@Override
	public List<OrderEntity> listByStatus(Integer status) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderEntity> listByEnterpriseId(Long enterpriseId) {
		return orderRepository.findByEnterpriseIdOrderByUpdateTimeDesc(enterpriseId);
	}

}

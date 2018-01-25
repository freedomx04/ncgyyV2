package com.hm.ncgyy.repository.business;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.business.MessageEntity;

public interface MessageRepository extends CrudRepository<MessageEntity, Long> {

	Iterable<MessageEntity> findByIdIn(List<Long> messageIds);
	
	List<MessageEntity> findByOrderByUpdateTimeDesc();
	
}

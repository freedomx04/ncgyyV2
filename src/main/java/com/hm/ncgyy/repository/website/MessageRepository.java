package com.hm.ncgyy.repository.website;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hm.ncgyy.entity.website.MessageEntity;

public interface MessageRepository extends CrudRepository<MessageEntity, Long> {

	Iterable<MessageEntity> findByIdIn(List<Long> messageIds);
	
	List<MessageEntity> findByOrderByUpdateTimeDesc();
	
}

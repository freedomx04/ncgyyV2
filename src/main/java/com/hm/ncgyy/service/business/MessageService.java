package com.hm.ncgyy.service.business;

import java.util.List;

import com.hm.ncgyy.entity.business.MessageEntity;

public interface MessageService {
	
	MessageEntity findOne(Long messageId);
	
	void save(MessageEntity message);
	
	void delete(List<Long> messageIds);
	
	List<MessageEntity> list();

}

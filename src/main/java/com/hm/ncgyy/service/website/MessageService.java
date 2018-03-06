package com.hm.ncgyy.service.website;

import java.util.List;

import com.hm.ncgyy.entity.website.MessageEntity;

public interface MessageService {
	
	MessageEntity findOne(Long messageId);
	
	void save(MessageEntity message);
	
	void delete(List<Long> messageIds);
	
	List<MessageEntity> list();

}

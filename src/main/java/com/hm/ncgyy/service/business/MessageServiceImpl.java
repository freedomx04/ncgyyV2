package com.hm.ncgyy.service.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.business.MessageEntity;
import com.hm.ncgyy.repository.business.MessageRepository;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageRepository messageRepository;

	@Override
	public MessageEntity findOne(Long messageId) {
		return messageRepository.findOne(messageId);
	}

	@Override
	public void save(MessageEntity message) {
		messageRepository.save(message);
	}

	@Override
	public void delete(List<Long> messageIds) {
		Iterable<MessageEntity> it = messageRepository.findByIdIn(messageIds);
		messageRepository.delete(it);
	}

	@Override
	public List<MessageEntity> list() {
		return messageRepository.findByOrderByUpdateTimeDesc();
	}

}

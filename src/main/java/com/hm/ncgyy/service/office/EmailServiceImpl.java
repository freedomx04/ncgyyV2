package com.hm.ncgyy.service.office;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.office.EmailEntity;
import com.hm.ncgyy.entity.office.EmailFileEntity;
import com.hm.ncgyy.repository.office.EmailFileRepository;
import com.hm.ncgyy.repository.office.EmailRepository;

@Service
public class EmailServiceImpl implements EmailService {
	
	@Autowired
	EmailRepository emailRepository;
	
	@Autowired
	EmailFileRepository emailFileRepository;

	@Override
	public EmailEntity findOne(Long emailId) {
		return emailRepository.findOne(emailId);
	}

	@Override
	public void save(EmailEntity email) {
		emailRepository.save(email);
	}

	@Override
	public void saveFile(EmailFileEntity emailFile) {
		emailFileRepository.save(emailFile);
	}

}

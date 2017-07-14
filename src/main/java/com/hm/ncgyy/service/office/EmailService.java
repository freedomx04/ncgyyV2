package com.hm.ncgyy.service.office;

import com.hm.ncgyy.entity.office.EmailEntity;
import com.hm.ncgyy.entity.office.EmailFileEntity;

public interface EmailService {

	EmailEntity findOne(Long emailId);
	
	void save(EmailEntity email);
	
	void saveFile(EmailFileEntity emailFile);
	
}

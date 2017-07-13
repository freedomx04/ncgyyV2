package com.hm.ncgyy.controller.office;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.office.EmailService;

@RestController
public class EmailController {
	
	static Logger log = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	UserService userService;
	
	
	

}

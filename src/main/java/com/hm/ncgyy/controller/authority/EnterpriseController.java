package com.hm.ncgyy.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.base.AreaService;

@RestController
public class EnterpriseController {
	
	static Logger log = LoggerFactory.getLogger(EnterpriseController.class);
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AreaService areaService;
	
	
	

}

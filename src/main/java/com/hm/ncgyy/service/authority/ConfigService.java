package com.hm.ncgyy.service.authority;

import com.hm.ncgyy.entity.authority.ConfigEntity;

public interface ConfigService {
	
	ConfigEntity find();
	
	void save(ConfigEntity config);
	
}

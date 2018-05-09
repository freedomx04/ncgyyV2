package com.hm.ncgyy.service.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.ConfigEntity;
import com.hm.ncgyy.repository.authority.ConfigRepository;

@Service
public class ConfigServiceImpl implements ConfigService {
	
	@Autowired
	ConfigRepository configRepository;

	@Override
	public ConfigEntity find() {
		ConfigEntity config = configRepository.findByName("config");
		if (config == null) {
			config = new ConfigEntity();
			config.setName("config");
			configRepository.save(config);
		}
		return config;
		
	}

	@Override
	public void save(ConfigEntity config) {
		configRepository.save(config);
	}

}

package com.hm.ncgyy.application.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 网页端配置类
 */
@Configuration
public class WebAppConfig extends WebMvcConfigurerAdapter {

	static Logger log = LoggerFactory.getLogger(WebAppConfig.class);

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		super.addInterceptors(registry);
	}
	
	/**
	 * 添加静态资源映射
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		super.addResourceHandlers(registry);
	}
}

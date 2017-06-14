package com.hm.ncgyy.service.monitor;

import java.io.InputStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;

public interface ReportService {
	
	HSSFWorkbook createTemplate(String monthly);
	
	void importTarget(InputStream is) throws Exception;
	
	HSSFWorkbook export(String monthly, Integer type) throws Exception;
	
	HSSFWorkbook export(EnterpriseBaseEntity enterprise) throws Exception;

}

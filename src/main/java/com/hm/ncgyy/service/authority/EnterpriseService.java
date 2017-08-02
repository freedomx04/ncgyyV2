package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;

public interface EnterpriseService {
	
	EnterpriseEntity findOne(Long enterpriseId);
	
	EnterpriseEntity findByName(String name);
	
	void save(EnterpriseEntity enterprise);
	
	void delete(Long enterpriseId);
	
	List<EnterpriseEntity> list();
	
	Page<EnterpriseEntity> list(int page, int size);
	
	/**
	 * base enterprise
	 */
	EnterpriseBaseEntity findOneBase(Long enterpriseId);
	
	EnterpriseBaseEntity findByNameBase(String name);
	
	List<EnterpriseBaseEntity> listBase();
	
	Page<EnterpriseBaseEntity> listBase(int page, int size);
	
	List<EnterpriseBaseEntity> listByAreaId(Long areaId);
	
	List<EnterpriseBaseEntity> listByIndustryId(Long industryId);
	
	List<EnterpriseBaseEntity> listPoint();
	
	List<EnterpriseEntity> search(String input);
	
	Page<EnterpriseEntity> search(String input, int page, int size);
	
	
}

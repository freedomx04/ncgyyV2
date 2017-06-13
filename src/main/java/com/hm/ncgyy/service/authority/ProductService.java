package com.hm.ncgyy.service.authority;

import java.util.List;

import com.hm.ncgyy.entity.authority.ProductEntity;

public interface ProductService {
	
	ProductEntity findOne(Long productId);
	
	void save(ProductEntity product);
	
	void delete(Long productId);
	
	List<ProductEntity> listByEnterpriseId(Long enterpriseId);
	
	List<ProductEntity> listByEnterpriseIdPaging(Long enterpriseId, int page, int size);
	
	List<ProductEntity> list();
	
	List<ProductEntity> listPaging(int page, int size);
	
	List<ProductEntity> search(String input);
	
}

package com.hm.ncgyy.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.repository.authority.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public ProductEntity findOne(Long productId) {
		return productRepository.findOne(productId);
	}

	@Override
	public void save(ProductEntity product) {
		productRepository.save(product);
	}

	@Override
	public void delete(Long productId) {
		productRepository.delete(productId);
	}

	@Override
	public List<ProductEntity> listByEnterpriseId(Long enterpriseId) {
		return productRepository.findByEnterpriseId(enterpriseId);
	}

	@Override
	public List<ProductEntity> listByEnterpriseIdPaging(Long enterpriseId, int page, int size) {
		Page<ProductEntity> productPage = productRepository.findByEnterpriseId(enterpriseId, new PageRequest(page, size));
		return productPage.getContent();
	}

	@Override
	public List<ProductEntity> list() {
		return (List<ProductEntity>) productRepository.findAll();
	}

	@Override
	public List<ProductEntity> listPaging(int page, int size) {
		Page<ProductEntity> productPage = productRepository.findAll(new PageRequest(page, size));
		return productPage.getContent();
	}

	@Override
	public List<ProductEntity> search(String input) {
		return productRepository.findByNameContaining(input);
	}

}

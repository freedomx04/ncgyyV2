package com.hm.ncgyy.controller.authority;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.ProductService;

@RestController
public class ProductController {

	static Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	ProductService productService;

	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/product/create", method = RequestMethod.POST)
	public Result create(Long enterpriseId, String name, MultipartFile uploadImage, String specification,
			String introduction) {
		try {
			EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);

			String imagePath = null;
			if (uploadImage != null) {
				imagePath = commonService.saveImage(uploadImage);
			}

			Date now = new Date();
			ProductEntity product = new ProductEntity(enterprise, name, imagePath, specification, introduction, now, now);
			productService.save(product);

			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/product/update", method = RequestMethod.POST)
	public Result update(Long productId, String name, MultipartFile uploadImage, String specification,
			String introduction) {
		try {
			ProductEntity product = productService.findOne(productId);
			product.setName(name);
			product.setSpecification(specification);
			product.setIntroduction(introduction);
			product.setUpdateTime(new Date());

			if (uploadImage != null && !uploadImage.isEmpty()) {
				if (product.getImagePath() != null) {
					commonService.deleteImage(product.getImagePath());
				}
				String imagePath = commonService.saveImage(uploadImage);
				product.setImagePath(imagePath);
			}

			productService.save(product);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/product/delete")
	public Result delete(Long productId) {
		try {
			ProductEntity product = productService.findOne(productId);
			if (product.getImagePath() != null) {
				commonService.deleteImage(product.getImagePath());
			}
			productService.delete(productId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/product/batchDelete")
	public Result batchDelete(@RequestParam("productIdList[]") List<Long> productIdList) {
		try {
			for (Long productId : productIdList) {
				delete(productId);
			}
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/product/get")
	public Result get(Long productId) {
		try {
			ProductEntity product = productService.findOne(productId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", product);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/product/listByEnterpriseId")
	public Result listByEnterpriseId(Long enterpriseId) {
		try {
			List<ProductEntity> productList = productService.listByEnterpriseId(enterpriseId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", productList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/product/listPagingByEnterpriseId")
	public Result listPagingByEnterpriseId(Long enterpriseId, int page, int size) {
		try {
			List<ProductEntity> productList = productService.listByEnterpriseIdPaging(enterpriseId, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", productList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/product/list")
	public Result list() {
		try {
			List<ProductEntity> list = productService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/product/listPaging", method = RequestMethod.POST)
	public Result listPaging(int page, int size) {
		try {
			Page<ProductEntity> list = productService.listPaging(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
}

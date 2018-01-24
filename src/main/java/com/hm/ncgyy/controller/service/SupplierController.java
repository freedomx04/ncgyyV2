package com.hm.ncgyy.controller.service;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.service.SupplierService;

@RestController
public class SupplierController {

	static Logger log = LoggerFactory.getLogger(SupplierController.class);

	@Autowired
	UserService userService;

	@Autowired
	SupplierService supplierService;

	@RequestMapping(value = "/api/service/supplier/add", method = RequestMethod.POST)
	public Result create(Long userId, Integer type, String name, String imagePath, String profession, String property,
			String scale, String address, String phone, String fax, String contactUser, String contact,
			String introduction, String license, String licensePath) {
		try {
			SupplierEntity supplier = supplierService.findByName(name);
			if (supplier != null) {
				return new Result(Code.EXISTED.value(), "供应商名称已存在");
			}

			Date now = new Date();
			UserBaseEntity user = userService.findOneBase(userId);
			supplier = new SupplierEntity(user, type, name, imagePath, profession, property, scale, address, phone, fax,
					contactUser, contact, introduction, license, licensePath, now, now);
			supplierService.save(supplier);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/supplier/update", method = RequestMethod.POST)
	public Result update(Long supplierId, String imagePath, String scale, String address, String phone, String fax,
			String contactUser, String contact, String introduction) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			supplier.setImagePath(imagePath);
			supplier.setScale(scale);
			supplier.setAddress(address);
			supplier.setPhone(phone);
			supplier.setFax(fax);
			supplier.setContactUser(contactUser);
			supplier.setContact(contact);
			supplier.setIntroduction(introduction);
			supplier.setUpdateTime(new Date());
			supplierService.save(supplier);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/service/supplier/get")
	public Result get(Long supplierId) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", supplier);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	} 
	
	@RequestMapping(value = "/api/service/supplier/listUncertified")
	public Result listUncertified() {
		try {
			List<SupplierEntity> list = supplierService.listUncertified();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/service/supplier/listCertified")
	public Result listCertified() {
		try {
			List<SupplierEntity> list = supplierService.listCertified();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/service/supplier/listByTypeAndStatus")
	public Result listByTypeAndStatus(Integer type, Integer status) {
		try {
			List<SupplierEntity> list = supplierService.listByTypeAndStatus(type, status);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/service/supplier/upload", method = RequestMethod.POST)
	public Result upload(Long supplierId, String license, String licensePath) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			supplier.setLicense(license);
			supplier.setLicensePath(licensePath);
			supplierService.save(supplier);
			return new Result(Code.SUCCESS.value(), "上传成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/service/supplier/certification")
	public Result certification(Long supplierId, Integer status) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			supplier.setStatus(status);
			supplierService.save(supplier);
			return new Result(Code.SUCCESS.value(), "操作成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/service/supplier/findByUserIdAndType")
	public Result findByUserIdAndType(Long userId, Integer type) {
		try {
			SupplierEntity supplier = supplierService.findByUserIdAndType(userId, type);
			return new ResultInfo(Code.SUCCESS.value(), "ok", supplier);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

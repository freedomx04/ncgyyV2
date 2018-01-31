package com.hm.ncgyy.controller.service;

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

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.service.SupplierEntity;
import com.hm.ncgyy.entity.service.financing.FinancingEntity;
import com.hm.ncgyy.entity.service.financing.InvestEntity;
import com.hm.ncgyy.service.service.SupplierService;
import com.hm.ncgyy.service.service.financing.FinancingService;
import com.hm.ncgyy.service.service.financing.InvestService;

@RestController
public class FinancingController {

	static Logger log = LoggerFactory.getLogger(FinancingController.class);

	@Autowired
	SupplierService supplierService;

	@Autowired
	FinancingService financingService;

	@Autowired
	InvestService investService;

	/**
	 * 融资
	 */
	@RequestMapping(value = "/api/service/financing/financing/create", method = RequestMethod.POST)
	public Result financing_create(Long supplierId, String title, String profession, String purpose, String amount,
			String financingType, String description, String advantage, String contactUser, String contact) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			Date now = new Date();
			FinancingEntity financing = new FinancingEntity(supplier, title, profession, purpose, amount, financingType,
					description, advantage, contactUser, contact, now, now);
			financingService.save(financing);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/financing/update", method = RequestMethod.POST)
	public Result financing_update(Long financingId, String title, String profession, String purpose, String amount,
			String financingType, String description, String advantage, String contactUser, String contact) {
		try {
			FinancingEntity financing = financingService.findOne(financingId);
			financing.setTitle(title);
			financing.setProfession(profession);
			financing.setPurpose(purpose);
			financing.setAmount(amount);
			financing.setFinancingType(financingType);
			financing.setDescription(description);
			financing.setAdvantage(advantage);
			financing.setContactUser(contactUser);
			financing.setContact(contact);
			financing.setUpdateTime(new Date());
			financingService.save(financing);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/financing/delete")
	public Result financing_delete(Long financingId) {
		try {
			financingService.delete(financingId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/financing/deleteBatch")
	public Result financing_deleteBatch(@RequestParam("financingIdList[]") List<Long> financingIdList) {
		try {
			financingService.delete(financingIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/financing/get")
	public Result financing_get(Long financingId) {
		try {
			FinancingEntity financing = financingService.findOne(financingId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", financing);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/financing/listPaging", method = RequestMethod.POST)
	public Result financing_listPaging(int page, int size) {
		try {
			Page<FinancingEntity> list = financingService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/financing/listBySupplierId")
	public Result financing_listBySupplierId(Long supplierId) {
		try {
			List<FinancingEntity> list = financingService.listBySupplierId(supplierId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/financing/search", method = RequestMethod.POST)
	public Result financing_search(String searchStr, int page, int size) {
		try {
			Page<FinancingEntity> list = financingService.search(searchStr, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/financing/filter", method = RequestMethod.POST)
	public Result financing_filter(String profession, String financingType, int page, int size) {
		try {
			Page<FinancingEntity> list = financingService.filter(profession, financingType, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	/**
	 * 投资
	 */
	@RequestMapping(value = "/api/service/financing/invest/create", method = RequestMethod.POST)
	public Result invest_create(Long supplierId, String title, String investType, String fundType, String profession,
			String amount, String description, String remark, String contactUser, String contact) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			Date now = new Date();
			InvestEntity invest = new InvestEntity(supplier, title, investType, fundType, profession, amount,
					description, remark, contactUser, contact, now, now);
			investService.save(invest);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/invest/update", method = RequestMethod.POST)
	public Result invest_update(Long investId, String title, String investType, String fundType, String profession,
			String amount, String description, String remark, String contactUser, String contact) {
		try {
			InvestEntity invest = investService.findOne(investId);
			invest.setTitle(title);
			invest.setInvestType(investType);
			invest.setFundType(fundType);
			invest.setProfession(profession);
			invest.setAmount(amount);
			invest.setDescription(description);
			invest.setRemark(remark);
			invest.setContactUser(contactUser);
			invest.setContact(contact);
			invest.setUpdateTime(new Date());
			investService.save(invest);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/invest/delete")
	public Result invest_delete(Long investId) {
		try {
			investService.delete(investId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/invest/deleteBatch")
	public Result invest_deleteBatch(@RequestParam("investIdList[]") List<Long> investIdList) {
		try {
			investService.delete(investIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/invest/get")
	public Result invest_get(Long investId) {
		try {
			InvestEntity invest = investService.findOne(investId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", invest);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/invest/listPaging", method = RequestMethod.POST)
	public Result invest_listPaging(int page, int size) {
		try {
			Page<InvestEntity> list = investService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/invest/listBySupplierId")
	public Result invest_listBySupplierId(Long supplierId) {
		try {
			List<InvestEntity> list = investService.listBySupplierId(supplierId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/invest/search", method = RequestMethod.POST)
	public Result invest_search(String searchStr, int page, int size) {
		try {
			Page<InvestEntity> list = investService.search(searchStr, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/financing/invest/filter", method = RequestMethod.POST)
	public Result invest_filter(String profession, String investType, String fundType, int page, int size) {
		try {
			Page<InvestEntity> list = investService.filter(profession, investType, fundType, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

package com.hm.ncgyy.controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.common.utils.ConstantUtil;
import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.service.financing.FinancingEntity;
import com.hm.ncgyy.entity.service.financing.InvestEntity;
import com.hm.ncgyy.entity.service.information.DemandEntity;
import com.hm.ncgyy.entity.service.information.ServiceEntity;
import com.hm.ncgyy.entity.service.logistics.LineEntity;
import com.hm.ncgyy.entity.service.logistics.NetworkEntity;
import com.hm.ncgyy.entity.service.logistics.SupplyEntity;
import com.hm.ncgyy.entity.service.talent.JobEntity;
import com.hm.ncgyy.entity.service.talent.RecruitEntity;
import com.hm.ncgyy.entity.website.ArticleEntity;
import com.hm.ncgyy.entity.website.ItemEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.assist.AppealService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.NewsService;
import com.hm.ncgyy.service.authority.ProductService;
import com.hm.ncgyy.service.service.financing.FinancingService;
import com.hm.ncgyy.service.service.financing.InvestService;
import com.hm.ncgyy.service.service.information.DemandService;
import com.hm.ncgyy.service.service.information.ServiceService;
import com.hm.ncgyy.service.service.logistics.LineService;
import com.hm.ncgyy.service.service.logistics.NetworkService;
import com.hm.ncgyy.service.service.logistics.SupplyService;
import com.hm.ncgyy.service.service.talent.JobService;
import com.hm.ncgyy.service.service.talent.RecruitService;
import com.hm.ncgyy.service.website.ArticleService;
import com.hm.ncgyy.service.website.ItemService;

@Controller
public class PageController {
	
	static Logger log = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	NewsService newsService;
	
	@Autowired
	AppealService appealService;
	
	@Autowired
	RecruitService recruitService;
	
	@Autowired
	JobService jobService;
	
	@Autowired
	ServiceService serviceService;
	
	@Autowired
	DemandService demandService;
	
	@Autowired
	FinancingService financingService;
	
	@Autowired
	InvestService investService;
	
	@Autowired
	LineService lineService;
	
	@Autowired
	NetworkService networkService;
	
	@Autowired
	SupplyService supplyService;
	
	@Autowired
	ItemService itemService;
	
	/**
	 * 新闻页面
	 */
	@RequestMapping(value = "/newslist")
	String article(ModelMap modelMap, Integer type) {
		List<ArticleEntity> list = articleService.listByType(type);
		modelMap.addAttribute("count", list.size());
		return "pages/portal/article";
	}
	
	@RequestMapping(value = "/news/{articleId}")
	String articleContent(ModelMap modelMap, @PathVariable("articleId") Long articleId) throws IOException {
		ArticleEntity article = articleService.findOne(articleId);
		if (article != null) {
			modelMap.addAttribute("article", article);
		}
		return "pages/portal/content";
	}
	
	@RequestMapping(value = "/epnews")
	String newsContent(ModelMap modelMap, Long newsId, Long enterpriseId) throws IOException {
		NewsEntity news = newsService.findOne(newsId);
		if (news != null) {
			modelMap.addAttribute("news", news);
			modelMap.addAttribute("enterpriseId", enterpriseId);
		}
		
		return "pages/portal/epnews";
	}
	
	@RequestMapping(value = "/enterpriselist")
	String enterprise(ModelMap modelMap) {
		List<EnterpriseEntity> list = enterpriseService.list();
		modelMap.addAttribute("count", list.size());
		return "pages/portal/enterprise";
	}
	
	@RequestMapping(value = "/enterprise")
	String enterpriseInfo(ModelMap modelMap, Long enterpriseId) {
		EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
		modelMap.addAttribute("enterprise", enterprise);
		return "pages/portal/enterpriseinfo";
	}
	
	@RequestMapping(value = "/productlist")
	String product(ModelMap modelMap, Integer type) {
		List<ProductEntity> list = productService.list();
		modelMap.addAttribute("count", list.size());
		return "pages/portal/product";
	}
	
	@RequestMapping(value = "/product")
	String productInfo(ModelMap modelMap, Long productId) {
		ProductEntity product = productService.findOne(productId);
		modelMap.addAttribute("product", product);
		return "pages/portal/productinfo";
	}

	/**
	 * 监测平台页面
	 */
	@RequestMapping(value = "/monitorlist")
	String monitor() {
		return "pages/portal/monitor";
	}
	
	/**
	 * 监测平台页面
	 */
	@RequestMapping(value = "/assistlist")
	String assist() {
		return "pages/portal/assist";
	}
	
	@RequestMapping(value = "/assist")
	String assistInfo(ModelMap modelMap, Long appealId) {
		AppealEntity appeal = appealService.findOne(appealId);
		modelMap.addAttribute("appeal", appeal);
		return "pages/portal/assistinfo";
	}
	
	/**
	 * 招商管理页面 
	 */
	@RequestMapping(value = "/business")
	String business(ModelMap modelMap) {
		Page<ArticleEntity> dynamics = articleService.listByType(10, 0, 5);
		modelMap.addAttribute("dynamics", dynamics.getContent());
		
		Page<ArticleEntity> policys = articleService.listByType(11, 0, 5);
		modelMap.addAttribute("policys", policys.getContent());
		
		Page<ItemEntity> businesss = itemService.list(0, 5);
		modelMap.addAttribute("businesss", businesss.getContent());
		return "pages/portal/business/business";
	}
	
	@RequestMapping(value = "/business/dynamic")
	String business_dynamic(ModelMap modelMap) {
		return "pages/portal/business/dynamic";
	}
	
	@RequestMapping(value = "/business/dynamic/info")
	String dynamic_info(ModelMap model, Long dynamicId) {
		ArticleEntity dynamic = articleService.findOne(dynamicId);
		model.addAttribute("dynamic", dynamic);
		return "pages/portal/business/dynamic_info";
	}
	
	@RequestMapping(value = "/business/policy")
	String business_policy(ModelMap modelMap) {
		return "pages/portal/business/policy";
	}
	
	@RequestMapping(value = "/business/policy/info")
	String policy_info(ModelMap model, Long policyId) {
		ArticleEntity policy = articleService.findOne(policyId);
		model.addAttribute("policy", policy);
		return "pages/portal/business/policy_info";
	}
	
	@RequestMapping(value = "/business/item")
	String business_item(ModelMap modelMap) {
		return "pages/portal/business/item";
	}
	
	@RequestMapping(value = "/business/item/info")
	String item_info(ModelMap model, Long itemId) {
		ItemEntity item = itemService.findOne(itemId);
		model.addAttribute("item", item);
		return "pages/portal/business/item_info";
	}
	
	/**
	 * 服务平台页面
	 */
	@RequestMapping(value = {"/service", "/service/talent"})
	String service_talent(ModelMap modelMap) {
		modelMap.addAttribute("professions", ConstantUtil.professions);
		modelMap.addAttribute("salarys", ConstantUtil.salarys);
		modelMap.addAttribute("workingYearss", ConstantUtil.workingYearss);
		modelMap.addAttribute("educations", ConstantUtil.educations);
		return "pages/portal/service/talent";
	}
	
	@RequestMapping(value = "/service/talent/recruit/info")
	String recruit_info(ModelMap model, Long recruitId) {
		RecruitEntity recruit = recruitService.findOne(recruitId);
		model.addAttribute("recruit", recruit);
		return "pages/portal/service/talent_recruit_info";
	}
	
	@RequestMapping(value = "/service/talent/job/info")
	String job_info(ModelMap model, Long jobId) {
		JobEntity job = jobService.findOne(jobId);
		model.addAttribute("job", job);
		return "pages/portal/service/talent_job_info";
	}
	
	@RequestMapping(value = "/service/information")
	String service_information(ModelMap model) {
		return "pages/portal/service/information";
	}
	
	@RequestMapping(value = "/service/information/service/info")
	String service_info(ModelMap model, Long serviceId) {
		ServiceEntity service = serviceService.findOne(serviceId);
		model.addAttribute("service", service);
		return "pages/portal/service/information_service_info";
	}
	
	@RequestMapping(value = "/service/information/demand/info")
	String demand_info(ModelMap model, Long demandId) {
		DemandEntity demand = demandService.findOne(demandId);
		model.addAttribute("demand", demand);
		return "pages/portal/service/information_demand_info";
	}
	
	@RequestMapping(value = "/service/financing")
	String service_financing(ModelMap modelMap) {
		modelMap.addAttribute("professions", ConstantUtil.professions);
		modelMap.addAttribute("financingTypes", ConstantUtil.financingTypes);
		modelMap.addAttribute("investTypes", ConstantUtil.investTypes);
		modelMap.addAttribute("fundTypes", ConstantUtil.fundTypes);
		return "pages/portal/service/financing";
	}
	
	@RequestMapping(value = "/service/financing/financing/info")
	String financing_info(ModelMap model, Long financingId) {
		FinancingEntity financing = financingService.findOne(financingId);
		model.addAttribute("financing", financing);
		return "pages/portal/service/financing_financing_info";
	}
	
	@RequestMapping(value = "/service/financing/invest/info")
	String invest_info(ModelMap model, Long investId) {
		InvestEntity invest = investService.findOne(investId);
		model.addAttribute("invest", invest);
		return "pages/portal/service/financing_invest_info";
	}
	
	@RequestMapping(value = "/service/logistics")
	String service_logistics(ModelMap model) {
		return "pages/portal/service/logistics";
	}
	
	@RequestMapping(value = "/service/logistics/line/info")
	String line_info(ModelMap model, Long lineId) {
		LineEntity line = lineService.findOne(lineId);
		model.addAttribute("line", line);
		return "pages/portal/service/logistics_line_info";
	}
	
	@RequestMapping(value = "/service/logistics/network/info")
	String network_info(ModelMap model, Long networkId) {
		NetworkEntity network = networkService.findOne(networkId);
		model.addAttribute("network", network);
		return "pages/portal/service/logistics_network_info";
	}
	
	@RequestMapping(value = "/service/logistics/supply/info")
	String supply_info(ModelMap model, Long supplyId) {
		SupplyEntity supply = supplyService.findOne(supplyId);
		model.addAttribute("supply", supply);
		return "pages/portal/service/logistics_supply_info";
	}
	
}

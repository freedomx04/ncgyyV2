package com.hm.ncgyy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.common.utils.ConstantUtil;
import com.hm.ncgyy.common.utils.CurrentUserUtils;
import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
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
import com.hm.ncgyy.entity.website.BusinessItemEntity;
import com.hm.ncgyy.entity.website.VersionEntity;
import com.hm.ncgyy.entity.website.VideoEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.assist.AppealService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.NewsService;
import com.hm.ncgyy.service.authority.ProductService;
import com.hm.ncgyy.service.authority.UserService;
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
import com.hm.ncgyy.service.website.BusinessItemService;
import com.hm.ncgyy.service.website.VersionService;
import com.hm.ncgyy.service.website.VideoService;

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
	BusinessItemService businessItemService;

	@Autowired
	VersionService versionService;

	@Autowired
	UserService userService;
	
	@Autowired
	VideoService videoService;
	
	@RequestMapping(value = { "/", "/index" })
	String index(ModelMap modelMap) {
		Page<ArticleEntity> list = null;

		// 图片新闻
		list = articleService.listByType(1, 0, 5);
		modelMap.addAttribute("photonewsList", list.getContent());

		// 公示公告
		list = articleService.listByType(2, 0, 6);
		modelMap.addAttribute("announceList", list.getContent());

		// 政策法规
		list = articleService.listByType(3, 0, 5);
		modelMap.addAttribute("policyList", list.getContent());

		// 工业信息
		list = articleService.listByType(4, 0, 5);
		modelMap.addAttribute("overviewList", list.getContent());
		
		// 企业信息
		Page<EnterpriseEntity> enterprisePage = enterpriseService.list(0, 20);
		modelMap.addAttribute("enterpriseList", enterprisePage.getContent());

		// 产品信息
		Page<ProductEntity> productPage = productService.listPaging(0, 20);
		modelMap.addAttribute("productList", productPage.getContent());
		
		// 安全生产
		list = articleService.listByType(20, 0, 5);
		modelMap.addAttribute("saftyList", list.getContent());
		
		Page<VideoEntity> videoPage = videoService.listPaging(0, 1);
		modelMap.addAttribute("video", videoPage.getContent().get(0));
		
		// 帮扶平台
		Page<AppealEntity> appealPage = appealService.listPaging(0, 5);
		modelMap.addAttribute("appealList", appealPage.getContent());
		
		// 招商管理
		list = articleService.listByType(10, 0, 5);
		modelMap.addAttribute("businessDynamicList", list.getContent());
		
		list = articleService.listByType(11, 0, 5);
		modelMap.addAttribute("businessPolicyList", list.getContent());
		
		Page<BusinessItemEntity> itemPage = businessItemService.list(0, 5);
		modelMap.addAttribute("itemList", itemPage.getContent());

		// 服务平台
		Page<RecruitEntity> recruitPage = recruitService.list(0, 5);
		modelMap.addAttribute("recruitList", recruitPage.getContent());
		
		Page<JobEntity> jobPage = jobService.list(0, 5);
		modelMap.addAttribute("jobList", jobPage.getContent());
		
		Page<ServiceEntity> servicePage = serviceService.list(0, 5);
		modelMap.addAttribute("serviceList", servicePage.getContent());
		
		Page<DemandEntity> demandPage = demandService.list(0, 5);
		modelMap.addAttribute("demandList", demandPage.getContent());
		
		Page<FinancingEntity> financingPage = financingService.list(0, 5);
		modelMap.addAttribute("financingList", financingPage.getContent());
		
		Page<InvestEntity> investPage = investService.list(0, 5);
		modelMap.addAttribute("investList", investPage.getContent());
		
		Page<LineEntity> linePage = lineService.list(0, 5);
		modelMap.addAttribute("lineList", linePage.getContent());
		
		Page<SupplyEntity> supplyPage = supplyService.list(0, 5);
		modelMap.addAttribute("supplyList", supplyPage.getContent());
		
		return "index";
	}

	@RequestMapping(value = "/home")
	String home(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		user = userService.findOne(user.getId());
		modelMap.addAttribute("user", user);

		VersionEntity version = versionService.findLatest();
		if (version != null) {
			modelMap.addAttribute("versionCode", version.getCode());
		} else {
			modelMap.addAttribute("versionCode", "无");
		}

		return "home";
	}

	@RequestMapping(value = "/login")
	String login() {
		return "login";
	}

	@RequestMapping(value = "/register")
	String register() {
		return "register";
	}

	@RequestMapping(value = "/forgetpsw")
	String forgetpsw() {
		return "forgetpsw";
	}

	@RequestMapping(value = "/init")
	String init() {
		return "init";
	}
	
	/**
	 * 新闻中心
	 */
	@RequestMapping(value = "/news")
	String news() {
		return "page/news/news_list";
	}
	
	@RequestMapping(value = "/news/get")
	String news_get(ModelMap modelMap, Long newsid) {
		ArticleEntity article = articleService.findOne(newsid);
		modelMap.addAttribute("news", article);
		return "page/news/news_get";
	}
	
	/**
	 * 企业宣传
	 */
	@RequestMapping(value = "/enterprise")
	String enterprise() {
		return "page/enterprise/enterprise_list";
	}
	
	@RequestMapping(value = "/enterprise/get")
	String enterprise_get(ModelMap modelMap, Long eid) {
		EnterpriseEntity enterprise = enterpriseService.findOne(eid);
		modelMap.addAttribute("enterprise", enterprise);
		return "page/enterprise/enterprise_get";
	}	
	
	@RequestMapping(value = "/enterprise/news/get")
	String enterprise_news_get(ModelMap modelMap, Long newsid) {
		NewsEntity news = newsService.findOne(newsid);
		modelMap.addAttribute("news", news);
		return "page/news/news_get";
	}	
	
	/**
	 * 产品宣传
	 */
	@RequestMapping(value = "/product")
	String product() {
		return "page/enterprise/product_list";
	}
	
	@RequestMapping(value = "/product/get")
	String product_get(ModelMap modelMap, Long productid) {
		ProductEntity product = productService.findOne(productid);
		modelMap.addAttribute("product", product);
		return "page/enterprise/product_get";
	}
	
	/**
	 * 安全生产
	 */
	@RequestMapping(value = "/safty")
	String safty() {
		return "page/safty/safty_list";
	}
	
	@RequestMapping(value = "/safty/dynamic/get")
	String safty_dynamic(ModelMap modelMap, Long dynamicid) {
		ArticleEntity article = articleService.findOne(dynamicid);
		modelMap.addAttribute("news", article);
		return "page/news/news_get";
	}
	
	@RequestMapping(value = "/safty/video/get")
	String safty_video(ModelMap modelMap, Long videoid) {
		VideoEntity video = videoService.findOne(videoid);
		modelMap.addAttribute("video", video);
		return "page/safty/video_get";
	}
	
	/**
	 * 诉求列表
	 */
	@RequestMapping(value = "/appeal")
	String appeal() {
		return "page/appeal/appeal_list";
	}
	
	@RequestMapping(value = "/appeal/get")
	String appeal_get(ModelMap modelMap, Long appealid) {
		AppealEntity appeal = appealService.findOne(appealid);
		modelMap.addAttribute("appeal", appeal);
		return "page/appeal/appeal_get";
	}
	
	/**
	 * 招商管理
	 */
	@RequestMapping(value = "/business")
	String business(ModelMap modelMap) {
		Page<ArticleEntity> dynamics = articleService.listByType(10, 0, 5);
		modelMap.addAttribute("dynamics", dynamics.getContent());

		Page<ArticleEntity> policys = articleService.listByType(11, 0, 5);
		modelMap.addAttribute("policys", policys.getContent());

		Page<BusinessItemEntity> businesss = businessItemService.list(0, 5);
		modelMap.addAttribute("businesss", businesss.getContent());
		return "page/business/business";
	}

	@RequestMapping(value = "/business/dynamic")
	String business_dynamic(ModelMap modelMap) {
		return "page/business/dynamic";
	}

	@RequestMapping(value = "/business/dynamic/info")
	String dynamic_info(ModelMap model, Long dynamicId) {
		ArticleEntity dynamic = articleService.findOne(dynamicId);
		model.addAttribute("dynamic", dynamic);
		return "page/business/dynamic_info";
	}

	@RequestMapping(value = "/business/policy")
	String business_policy(ModelMap modelMap) {
		return "page/business/policy";
	}

	@RequestMapping(value = "/business/policy/info")
	String policy_info(ModelMap model, Long policyId) {
		ArticleEntity policy = articleService.findOne(policyId);
		model.addAttribute("policy", policy);
		return "page/business/policy_info";
	}

	@RequestMapping(value = "/business/item")
	String business_item(ModelMap modelMap) {
		return "page/business/item";
	}

	@RequestMapping(value = "/business/item/info")
	String item_info(ModelMap model, Long itemId) {
		BusinessItemEntity item = businessItemService.findOne(itemId);
		model.addAttribute("item", item);
		return "page/business/item_info";
	}
	
	/**
	 * 服务平台
	 */
	@RequestMapping(value = { "/service", "/service/talent" })
	String service_talent(ModelMap modelMap) {
		modelMap.addAttribute("professions", ConstantUtil.professions);
		modelMap.addAttribute("salarys", ConstantUtil.salarys);
		modelMap.addAttribute("workingYearss", ConstantUtil.workingYearss);
		modelMap.addAttribute("educations", ConstantUtil.educations);
		return "page/service/talent";
	}

	@RequestMapping(value = "/service/talent/recruit/info")
	String recruit_info(ModelMap model, Long recruitId) {
		RecruitEntity recruit = recruitService.findOne(recruitId);
		model.addAttribute("recruit", recruit);
		return "page/service/talent_recruit_info";
	}

	@RequestMapping(value = "/service/talent/job/info")
	String job_info(ModelMap model, Long jobId) {
		JobEntity job = jobService.findOne(jobId);
		model.addAttribute("job", job);
		return "page/service/talent_job_info";
	}

	@RequestMapping(value = "/service/information")
	String service_information(ModelMap model) {
		return "page/service/information";
	}

	@RequestMapping(value = "/service/information/service/info")
	String service_info(ModelMap model, Long serviceId) {
		ServiceEntity service = serviceService.findOne(serviceId);
		model.addAttribute("service", service);
		return "page/service/information_service_info";
	}

	@RequestMapping(value = "/service/information/demand/info")
	String demand_info(ModelMap model, Long demandId) {
		DemandEntity demand = demandService.findOne(demandId);
		model.addAttribute("demand", demand);
		return "page/service/information_demand_info";
	}

	@RequestMapping(value = "/service/financing")
	String service_financing(ModelMap modelMap) {
		modelMap.addAttribute("professions", ConstantUtil.professions);
		modelMap.addAttribute("financingTypes", ConstantUtil.financingTypes);
		modelMap.addAttribute("investTypes", ConstantUtil.investTypes);
		modelMap.addAttribute("fundTypes", ConstantUtil.fundTypes);
		return "page/service/financing";
	}

	@RequestMapping(value = "/service/financing/financing/info")
	String financing_info(ModelMap model, Long financingId) {
		FinancingEntity financing = financingService.findOne(financingId);
		model.addAttribute("financing", financing);
		return "page/service/financing_financing_info";
	}

	@RequestMapping(value = "/service/financing/invest/info")
	String invest_info(ModelMap model, Long investId) {
		InvestEntity invest = investService.findOne(investId);
		model.addAttribute("invest", invest);
		return "page/service/financing_invest_info";
	}

	@RequestMapping(value = "/service/logistics")
	String service_logistics(ModelMap model) {
		return "page/service/logistics";
	}

	@RequestMapping(value = "/service/logistics/line/info")
	String line_info(ModelMap model, Long lineId) {
		LineEntity line = lineService.findOne(lineId);
		model.addAttribute("line", line);
		return "page/service/logistics_line_info";
	}

	@RequestMapping(value = "/service/logistics/network/info")
	String network_info(ModelMap model, Long networkId) {
		NetworkEntity network = networkService.findOne(networkId);
		model.addAttribute("network", network);
		return "page/service/logistics_network_info";
	}

	@RequestMapping(value = "/service/logistics/supply/info")
	String supply_info(ModelMap model, Long supplyId) {
		SupplyEntity supply = supplyService.findOne(supplyId);
		model.addAttribute("supply", supply);
		return "page/service/logistics_supply_info";
	}
	
	/**
	 * 电力服务
	 */
	@RequestMapping(value = "/power")
	String power() {
		return "page/news/power_list";
	}
	
}

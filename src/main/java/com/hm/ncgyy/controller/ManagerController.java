package com.hm.ncgyy.controller;

import java.io.IOException;
import java.util.List;

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
import com.hm.ncgyy.entity.authority.AppealTypeEntity;
import com.hm.ncgyy.entity.authority.AreaEntity;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.IndustryEntity;
import com.hm.ncgyy.entity.authority.LoginEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.entity.office.MailEntity;
import com.hm.ncgyy.entity.office.MailEntity.ReadStatus;
import com.hm.ncgyy.entity.service.ApplyEntity;
import com.hm.ncgyy.entity.service.DeclareEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;
import com.hm.ncgyy.entity.service.SupplierEntity.SupplierType;
import com.hm.ncgyy.entity.website.ArticleEntity;
import com.hm.ncgyy.entity.website.ItemEntity;
import com.hm.ncgyy.entity.website.VersionEntity;
import com.hm.ncgyy.entity.website.VideoEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.assist.AppealService;
import com.hm.ncgyy.service.authority.AppealTypeService;
import com.hm.ncgyy.service.authority.AreaService;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.IndustryService;
import com.hm.ncgyy.service.authority.LoginService;
import com.hm.ncgyy.service.authority.NewsService;
import com.hm.ncgyy.service.authority.ProductService;
import com.hm.ncgyy.service.authority.RoleService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.office.MailService;
import com.hm.ncgyy.service.service.ApplyService;
import com.hm.ncgyy.service.service.DeclareService;
import com.hm.ncgyy.service.service.SupplierService;
import com.hm.ncgyy.service.service.talent.JobService;
import com.hm.ncgyy.service.service.talent.RecruitService;
import com.hm.ncgyy.service.website.ArticleService;
import com.hm.ncgyy.service.website.ItemService;
import com.hm.ncgyy.service.website.VersionService;
import com.hm.ncgyy.service.website.VideoService;

@Controller
public class ManagerController {
	
	static Logger log = LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	IndustryService industryService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	NewsService newsService;
	
	@Autowired
	VersionService versionService;
	
	@Autowired
	DeclareService declareService;
	
	@Autowired
	ApplyService applyService;

	@Autowired
	AppealService appealService;
	
	@Autowired
	AppealTypeService appealTypeService;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	SupplierService supplierService;
	
	@Autowired
	RecruitService recruitService;
	
	@Autowired
	JobService jobService;
	
	@Autowired
	VideoService videoService;
	
	@Autowired
	ItemService itemService;
	
	/**
	 * 总览
	 */
	@RequestMapping(value = "/overview")
	String overview(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		user = userService.findOne(user.getId());
		modelMap.addAttribute("user", user);
		
		Page<LoginEntity> loginPage = loginService.listByUserId(user.getId(), 0, 10);
		List<LoginEntity> loginList = loginPage.getContent();
		modelMap.addAttribute("loginList", loginList);
		
		if (loginList.size() > 0) {
			modelMap.addAttribute("latestLogin", loginList.get(0));
		}
		
		VersionEntity version = versionService.findLatest();
		modelMap.addAttribute("version", version);
		return "pages/overview";
	}
	
	/**
	 * 系统管理接口
	 */
	@RequestMapping(value = "/authority/data")
	String data() {
		return "pages/authority/data";
	}
	
	@RequestMapping(value = "/authority/user")
	String userList(ModelMap modelMap) {
		List<RoleEntity> roleList = roleService.list();
		modelMap.addAttribute("roleList", roleList);
		return "pages/authority/user";
	}
	
	@RequestMapping(value = "/authority/user/add")
	String userAdd(ModelMap modelMap, String method, Long userId) {
		String title = method.equals("add") ? "用户新增" : "用户编辑";
		List<RoleEntity> roleList = roleService.list();
		List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
		List<DepartmentEntity> departmentList = departmentService.list();
		
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("roleList", roleList);
		modelMap.addAttribute("enterpriseList", enterpriseList);
		modelMap.addAttribute("departmentList", departmentList);
		
		if (userId != null) {
			UserEntity user = userService.findOne(userId);
			modelMap.addAttribute("user", user);
		}
		return "pages/authority/user_add";
	}
	
	@RequestMapping(value = "/authority/enterprise")
	String enterprise(ModelMap modelMap) {
		List<AreaEntity> areaList = areaService.list();
		modelMap.addAttribute("areaList", areaList);
		return "pages/authority/enterprise";
	}
	
	@RequestMapping(value = "/authority/enterprise/add")
	String enterpriseAdd(ModelMap modelMap, String method, Long enterpriseId) {
		List<AreaEntity> areaList = areaService.list();
		List<IndustryEntity> industryList = industryService.list();
		
		String title = method.equals("add") ? "企业新增" : "企业编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		modelMap.addAttribute("areaList", areaList);
		modelMap.addAttribute("industryList", industryList);
		
		if (enterpriseId != null) {
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			modelMap.addAttribute("enterprise", enterprise);
		}
		return "pages/authority/enterprise_add";
	}
	
	@RequestMapping(value = "/authority/enterprise/get")
	String enterpriseGet(ModelMap modelMap, String source, Long enterpriseId) {
		modelMap.addAttribute("source", source);
		
		EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
		modelMap.addAttribute("enterprise", enterprise);
		
		List<AreaEntity> areaList = areaService.list();
		modelMap.addAttribute("areaList", areaList);
		
		List<IndustryEntity> industryList = industryService.list();
		modelMap.addAttribute("industryList", industryList);
		
		return "pages/authority/enterprise_get";
	}
	
	@RequestMapping(value = "/authority/enterprise/product/add")
	String productAdd(ModelMap modelMap, String method, Long productId, Long enterpriseId) {
		String title = method.equals("add") ? "产品新增" : "产品编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("enterpriseId", enterpriseId);
		
		if (productId != null) {
			ProductEntity product = productService.findOne(productId);
			modelMap.addAttribute("product", product);
		}
		return "pages/authority/product_add";
	}
	
	@RequestMapping(value = "/authority/enterprise/news/add")
	String newsAdd(ModelMap modelMap, String method, Long newsId, Long enterpriseId) throws IOException {
		String title = method.equals("add") ? "新闻新增" : "新闻编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("enterpriseId", enterpriseId);
		
		if (newsId != null) {
			NewsEntity news = newsService.findOne(newsId);
			modelMap.addAttribute("news", news);
		}
		return "pages/authority/news_add";
	}
	
	@RequestMapping(value = "/authority/enterprise/news/get")
	String newsGet(ModelMap modelMap, Long newsId) throws IOException {
		NewsEntity news = newsService.findOne(newsId);
		modelMap.addAttribute("news", news);
		return "pages/authority/news_get";
	}
	
	@RequestMapping(value = "/authority/department")
	String department(ModelMap modelMap) {
		return "pages/authority/department";
	}
	
	@RequestMapping(value = "/authority/supplier")
	String supplierList(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/authority/supplier";
	}
	
	@RequestMapping(value = "/authority/version")
	String versionList(ModelMap modelMap) {
		return "pages/authority/version";
	}
	
	@RequestMapping(value = "/versionHistory")
	String version(ModelMap modelMap) {
		List<VersionEntity> versionList = versionService.list();
		modelMap.addAttribute("versionList", versionList);
		return "pages/authority/version_history";
	}
	
	/** 
	 * 网站管理接口
	 */
	@RequestMapping(value = "/website/article")
	String website(ModelMap modelMap) {
		return "pages/website/article";
	}
	
	@RequestMapping(value = "/website/article/add")
	String article_add(ModelMap modelMap, Integer type, String method, Long articleId) throws IOException {
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("method", method);
		
		String title = articleService.getArticleTitle(type);
		title += method.equals("add") ? " - 新增" : " - 编辑";
		modelMap.addAttribute("title", title);
		
		if (articleId != null) {
			ArticleEntity article = articleService.findOne(articleId);
			modelMap.addAttribute("article", article);
		}
		return "pages/website/article_add";
	}
	
	@RequestMapping(value = "/website/article/get")
	String article_get(ModelMap modelMap, Long articleId) throws IOException {
		ArticleEntity article = articleService.findOne(articleId);
		if (article != null) {
			modelMap.addAttribute("article", article);
			String title = articleService.getArticleTitle(article.getType());
			modelMap.addAttribute("title", title);
		}
		return "pages/website/article_get";
	}
	
	@RequestMapping(value = "/website/party")
	String party(ModelMap modelMap) {
		return "pages/website/party";
	}
	
	@RequestMapping(value = "/website/project")
	String project(ModelMap modelMap) {
		return "pages/website/project";
	}
	
	@RequestMapping(value = "/website/item")
	String item(ModelMap modelMap) {
		return "pages/website/item";
	}
	
	@RequestMapping(value = "/website/item/add")
	String item_add(ModelMap modelMap, String method, Long itemId) {
		String title = method.equals("add") ? "项目新增" : "项目编辑";
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("itemLevels", ConstantUtil.itemLevels);
		
		if (itemId != null) {
			ItemEntity item = itemService.findOne(itemId);
			modelMap.addAttribute("item", item);
		}
		return "pages/website/item_add";
	}
	
	@RequestMapping(value = "/website/item/public")
	String item_public(ModelMap modelMap, Long itemId) {
		ItemEntity item = itemService.findOne(itemId);
		modelMap.addAttribute("item", item);
		return "pages/website/item_public";
	}
	
	@RequestMapping(value = "/website/business")
	String business(ModelMap modelMap) {
		return "pages/website/business";
	}
	
	@RequestMapping(value = "/website/safty")
	String safty(ModelMap modelMap) {
		return "pages/website/safty";
	}
	
	@RequestMapping(value = "/website/safty/video/add")
	String safty_add(ModelMap modelMap, String method, Long videoId) {
		String title = "视频材料" + ( method.equals("add") ? " - 新增" : " - 编辑");
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("title", title);
		
		if (videoId != null) {
			VideoEntity video = videoService.findOne(videoId);
			modelMap.addAttribute("video", video);
		}
		return "pages/website/safty_video_add";
	}
	
	@RequestMapping(value = "/website/safty/video/get")
	String safty_get(ModelMap modelMap, Long videoId) {
		VideoEntity video = videoService.findOne(videoId);
		modelMap.addAttribute("video", video);
		return "pages/website/safty_video_get";
	}
	
	@RequestMapping(value = "/website/parallelApprove")
	String parallelApprove(ModelMap modelMap) {
		return "pages/website/parallel_approve";
	}
	
	@RequestMapping(value = "/website/feedback")
	String feedbackList(ModelMap modelMap) {
		return "pages/website/feedback";
	}
	
	/**
	 * 监测平台接口
	 */
	@RequestMapping(value = "/monitor/report")
	String targetImport(ModelMap modelMap) {
		return "pages/monitor/target_report";
	}
	
	@RequestMapping(value = "/monitor/enterprise")
	String targetEnterprise() {
		return "pages/monitor/target_enterprise";
	}
	
	@RequestMapping(value = "/monitor/industry")
	String targetIndustry() {
		return "pages/monitor/target_industry";
	}
	
	@RequestMapping(value = "/monitor/area")
	String targetArea() {
		return "pages/monitor/target_area";
	}
	
	@RequestMapping(value = "/monitor/pointEnterprise")
	String targetPointEnterprise() {
		return "pages/monitor/target_point_enterprise";
	}
	
	@RequestMapping(value = "/monitor/myEnterprise")
	String targetEP(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		if (user.getEnterprise() == null) {
			modelMap.addAttribute("type", new String("ep"));
			return "pages/warning";
		} else {
			modelMap.addAttribute("user", user);
			return "pages/monitor/target_ep";
		}
	}
	
	@RequestMapping(value = "/monitor/economic/report")
	String economic_report() {
		return "pages/monitor/economic_report";
	}
	
	@RequestMapping(value = "/monitor/economic")
	String economic() {
		return "pages/monitor/economic";
	}
	
	/**
	 * 大数据中心接口
	 */
	@RequestMapping(value = "/dataCenter/economic")
	String dataCenter_economic () {
		return "pages/dataCenter/economic";
	}
	
	/**
	 * 帮扶平台接口
	 */
	@RequestMapping(value = "/assist/appeal")
	String appealList() {
		return "pages/assist/appeal_list";
	}
	
	@RequestMapping(value = "/assist/enterprise")
	String appealEnterprise(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		
		if (user.getEnterprise() == null) {
			modelMap.addAttribute("type", new String("ep"));
			return "pages/warning";
		} else {
			modelMap.addAttribute("user", user);
			return "pages/assist/appeal_enterprise";
		}
	}
	
	@RequestMapping(value = "/assist/department")
	String appealDepartment(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		
		if (user.getDepartment() == null) {
			modelMap.addAttribute("type", new String("gv"));
			return "pages/warning";
		} else {
			modelMap.addAttribute("user", user);
			return "pages/assist/appeal_department";
		}
	}
	
	@RequestMapping(value = "/assist/dispatcher")
	String appealDispatcher(ModelMap modelMap) {
		List<DepartmentEntity> departmentList = departmentService.list();
		modelMap.addAttribute("departmentList", departmentList);
		return "pages/assist/appeal_dispatcher";
	}
	
	@RequestMapping(value = "/assist/appeal/add")
	String appealAdd(ModelMap modelMap, String method, Long appealId) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("enterpriseId", user.getEnterprise().getId());
		
		String title = method.equals("add") ? "诉求新增" : "诉求编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		List<AppealTypeEntity> appealTypeList = appealTypeService.list();
		modelMap.addAttribute("appealTypeList", appealTypeList);
		
		if (appealId != null) {
			AppealEntity appeal = appealService.findOne(appealId);
			modelMap.addAttribute("appeal", appeal);
		}
		return "pages/assist/appeal_add";
	}
	
	@RequestMapping(value = "/assist/appeal/get")
	String appealGet(ModelMap modelMap, Long appealId) {
		AppealEntity appeal = appealService.findOne(appealId);
		modelMap.addAttribute("appeal", appeal);
		return "pages/assist/appeal_get";
	}
	
	/**
	 * 服务平台接口
	 */
	@RequestMapping(value = "/service/supplierApply")
	String supplierApply(ModelMap modelMap, Integer type) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("userId", user.getId());
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("professions", ConstantUtil.professions);
		modelMap.addAttribute("propertys", ConstantUtil.propertys);
		modelMap.addAttribute("scales", ConstantUtil.scales);
		return "pages/service/supplier_apply";
	}
	
	@RequestMapping(value = "/service/platformTalent")
	String platformTalent(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		SupplierEntity supplier = supplierService.findByUserIdAndType(user.getId(), SupplierType.TYPE_TALENT);
		modelMap.addAttribute("supplier", supplier);
		modelMap.addAttribute("userId", user.getId());
		
		modelMap.addAttribute("professions", ConstantUtil.professions);
		modelMap.addAttribute("salarys", ConstantUtil.salarys);
		modelMap.addAttribute("workingYearss", ConstantUtil.workingYearss);
		modelMap.addAttribute("educations", ConstantUtil.educations);
		return "pages/service/platform_talent";
	}
	
	@RequestMapping(value = "/service/platformInformation")
	String platformBusiness(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		SupplierEntity supplier = supplierService.findByUserIdAndType(user.getId(), SupplierType.TYPE_INFORMATION);
		modelMap.addAttribute("supplier", supplier);
		modelMap.addAttribute("userId", user.getId());
		return "pages/service/platform_information";
	}
	
	@RequestMapping(value = "/service/platformFinancing")
	String platformFinancing(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		SupplierEntity supplier = supplierService.findByUserIdAndType(user.getId(), SupplierType.TYPE_FINANCING);
		modelMap.addAttribute("supplier", supplier);
		modelMap.addAttribute("userId", user.getId());
		
		modelMap.addAttribute("professions", ConstantUtil.professions);
		modelMap.addAttribute("financingTypes", ConstantUtil.financingTypes);
		modelMap.addAttribute("investTypes", ConstantUtil.investTypes);
		modelMap.addAttribute("fundTypes", ConstantUtil.fundTypes);
		return "pages/service/platform_financing";
	}
	
	@RequestMapping(value = "/service/platformLogistics")
	String platformLogistics(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		SupplierEntity supplier = supplierService.findByUserIdAndType(user.getId(), SupplierType.TYPE_LOGISITCS);
		modelMap.addAttribute("supplier", supplier);
		modelMap.addAttribute("userId", user.getId());
		
		modelMap.addAttribute("transportModes", ConstantUtil.transportModes);
		return "pages/service/platform_logistics";
	}
	
	@RequestMapping(value = "/power/power")
	String platformPower(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "pages/power/power";
	}
	
	@RequestMapping(value = "/declareGV")
	String declareGV(ModelMap modelMap) {
		UserEntity currentUser = CurrentUserUtils.getInstance().getUser();
		UserEntity user = userService.findOne(currentUser.getId());
		modelMap.addAttribute("user", user);
		
		return "pages/service/declare_gv";
	}
	
	@RequestMapping(value = "/declareEP")
	String declareEP(ModelMap modelMap) {
		UserEntity currentUser = CurrentUserUtils.getInstance().getUser();
		UserEntity user = userService.findOne(currentUser.getId());
		
		if (user.getEnterprise() == null) {
			modelMap.addAttribute("type", new String("ep"));
			return "pages/warning";
		} else {
			modelMap.addAttribute("user", user);
			return "pages/service/declare_ep";
		}
	}
	
	@RequestMapping(value = "/declareAdd")
	String declareAdd(ModelMap modelMap, String method, Long declareId) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		
		String title = method.equals("add") ? "网上申报新增" : "网上申报编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		if (declareId != null) {
			DeclareEntity declare = declareService.findOne(declareId);
			modelMap.addAttribute("declare", declare);
		}
		
		return "pages/service/declare_add";
	}
	
	@RequestMapping(value = "/declareGet")
	String declareGet(ModelMap modelMap, Long declareId) {
		DeclareEntity declare = declareService.findOne(declareId);
		modelMap.addAttribute("declare", declare);
		
		return "pages/service/declare_get";
	}
	
	@RequestMapping(value = "/applyGet")
	String applyGet(ModelMap modelMap, Long applyId) {
		ApplyEntity apply = applyService.findOne(applyId);
		modelMap.addAttribute("apply", apply);
		
		return "pages/service/declare_apply_get";
	}
	
	@RequestMapping(value = "/declare/enterprise")
	String declareEnterprise() {
		return "pages/service/declare_enterprise_list";
	}
	
	@RequestMapping(value = "/applyAdd")
	String applyAdd(ModelMap modelMap, String method, Long applyId) {
		String title = method.equals("add") ? "申报" : "申报编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		if (applyId != null) {
			ApplyEntity apply = applyService.findOne(applyId);
			modelMap.addAttribute("apply", apply);
		}
		
		return "pages/service/declare_apply_add";
	}
	
	/**
	 * 电力服务
	 */
	@RequestMapping(value = "/power/dynamic")
	String power_dynamic(ModelMap modelMap) {
		return "pages/power/dynamic";
	}
	
	@RequestMapping(value = "/power/order")
	String power_order(ModelMap modelMap) {
		return "pages/power/order";
	}
	
	/**
	 * 个人中心
	 */
	@RequestMapping(value = "/personal/info")
	String personalInfo(ModelMap modelMap) {
		UserEntity currentUser = CurrentUserUtils.getInstance().getUser();
		UserEntity user = userService.findOne(currentUser.getId());
		modelMap.addAttribute("user", user);
		return "pages/personal/info";
	}
	
	@RequestMapping(value = "/personal/password")
	String modifyPassword(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "pages/personal/password";
	}
	
	@RequestMapping(value = "/personal/enterprise")
	String personalEnterprise(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		if (user.getEnterprise() == null) {
			modelMap.addAttribute("type", "ep");
			return "pages/warning";
		} else {
			modelMap.addAttribute("source", "personal");
			
			EnterpriseEntity enterprise = enterpriseService.findOne(user.getEnterprise().getId());
		    modelMap.addAttribute("enterprise", enterprise);
		    
		    List<AreaEntity> areaList = areaService.list();
		    modelMap.addAttribute("areaList", areaList);
		    
		    List<IndustryEntity> industryList = industryService.list();
		    modelMap.addAttribute("industryList", industryList);
			
			return "pages/authority/enterprise_get";
		}
	}
	
	@RequestMapping(value = "/personal/login")
	String loginHistory(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "pages/personal/login";
	}
	
	@RequestMapping(value = "/mailList")
	String mailList(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "pages/office/mail_list";
	}
	
	@RequestMapping(value = "/mailAdd")
	String mailAdd(ModelMap modelMap, String method, Long mailId) throws IOException {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		
		String title = method.equals("add") ? "写信" : "草稿";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		List<UserBaseEntity> userList = userService.listBase();
		modelMap.addAttribute("userList", userList);
		
		if (mailId != null) {
			MailEntity mail = mailService.findOne(mailId);
			modelMap.addAttribute("mail", mail);
		}
		return "pages/office/mail_add";
	}
	
	@RequestMapping(value = "/mailGet")
	String mailGet(ModelMap modelMap, Long mailId) throws IOException {
		MailEntity mail = mailService.findOne(mailId);
		if (mail.getReadStatus() == ReadStatus.UNREAD) {
			mail.setReadStatus(ReadStatus.READ);
			mailService.save(mail);
		}
		
		modelMap.addAttribute("mail", mail);
		return "pages/office/mail_get";
	}

}

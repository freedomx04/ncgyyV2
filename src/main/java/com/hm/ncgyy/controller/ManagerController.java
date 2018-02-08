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
import com.hm.ncgyy.common.utils.CurrentUserUtils;
import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.LoginEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.entity.authority.VersionEntity;
import com.hm.ncgyy.entity.base.AppealTypeEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.entity.office.MailEntity;
import com.hm.ncgyy.entity.office.MailEntity.ReadStatus;
import com.hm.ncgyy.entity.service.ApplyEntity;
import com.hm.ncgyy.entity.service.DeclareEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;
import com.hm.ncgyy.entity.service.SupplierEntity.SupplierType;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.assist.AppealService;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.LoginService;
import com.hm.ncgyy.service.authority.NewsService;
import com.hm.ncgyy.service.authority.ProductService;
import com.hm.ncgyy.service.authority.RoleService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.authority.VersionService;
import com.hm.ncgyy.service.base.AppealTypeService;
import com.hm.ncgyy.service.base.AreaService;
import com.hm.ncgyy.service.base.IndustryService;
import com.hm.ncgyy.service.issue.ArticleService;
import com.hm.ncgyy.service.office.MailService;
import com.hm.ncgyy.service.service.ApplyService;
import com.hm.ncgyy.service.service.DeclareService;
import com.hm.ncgyy.service.service.SupplierService;
import com.hm.ncgyy.service.service.talent.JobService;
import com.hm.ncgyy.service.service.talent.RecruitService;

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
	 * 角色管理接口
	 */
	@RequestMapping(value = "/roleList")
	String roleList(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/authority/role_list";
	}
	
	@RequestMapping(value = "/roleAdd")
	String roleAdd(ModelMap modelMap, String method, Long roleId) {
		String title = "";
		switch (method) {
		case "add":
			title = "角色新增";
			break;
		case "edit":
			title = "角色编辑";
			break;
		case "detail":
			title = "角色详情";
			break;
		}
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		if (roleId != null) {
			RoleEntity role = roleService.findOne(roleId);
			modelMap.addAttribute("role", role);
		}
		
		return "pages/authority/role_add";
	}
	
	/**
	 * 用户接口
	 */
	@RequestMapping(value = "/userList")
	String userList(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/authority/user_list";
	}
	
	@RequestMapping(value = "/userAdd")
	String userAdd(ModelMap modelMap, String method, Long userId) {
		String title = "";
		switch (method) {
		case "add":
			title = "用户新增";
			break;
		case "edit":
			title = "用户编辑";
			break;
		case "detail":
			title = "用户详情";
			break;
		}
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
	
	@RequestMapping(value = "/userGet")
	String userGet(ModelMap modelMap, Long userId) {
		UserEntity user = userService.findOne(userId);
		modelMap.addAttribute("user", user);
		
		return "pages/authority/user_get";
	}
	
	/**
	 * 企业接口
	 */
	@RequestMapping(value = "/enterpriseList")
	String enterpriseList(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/authority/enterprise_list";
	}
	
	@RequestMapping(value = "/enterpriseAdd")
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
	
	@RequestMapping(value = "/enterpriseGet")
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
	
	@RequestMapping(value = "/productAdd")
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
	
	@RequestMapping(value = "/productGet")
	String productGet(ModelMap modelMap, Long productId) {
		ProductEntity product = productService.findOne(productId);
		modelMap.addAttribute("product", product);
		
		return "pages/authority/product_get";
	}
	
	@RequestMapping(value = "/newsAdd")
	String newsAdd(ModelMap modelMap, String method, Long newsId, Long enterpriseId) throws IOException {
		String title = method.equals("add") ? "新闻新增" : "新闻编辑";
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		modelMap.addAttribute("enterpriseId", enterpriseId);
		
		if (newsId != null) {
			NewsEntity news = newsService.findOne(newsId);
			String content = commonService.getArticleContent(news.getPath());
			news.setContent(content);
			modelMap.addAttribute("news", news);
		}
		
		return "pages/authority/news_add";
	}
	
	@RequestMapping(value = "/newsGet")
	String newsGet(ModelMap modelMap, Long newsId) throws IOException {
		NewsEntity news = newsService.findOne(newsId);
		String content = commonService.getArticleContent(news.getPath());
		news.setContent(content);
		modelMap.addAttribute("news", news);
		
		return "pages/authority/news_get";
	}
	
	@RequestMapping(value = "/department")
	String department(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/authority/department";
	}
	
	/**
	 * 供应商管理接口
	 */
	@RequestMapping(value = "/supplierList")
	String supplierList(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/authority/supplier_list";
	}
	
	/**
	 * 反馈接口
	 */
	@RequestMapping(value = "/feedbackList")
	String feedbackList(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/authority/feedback_list";
	}
	
	/**
	 * 版本接口
	 */
	@RequestMapping(value = "/versionList")
	String versionList(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/authority/version_list";
	}
	
	@RequestMapping(value = "versionAdd")
	String versionAdd(ModelMap modelMap, String method, Long versionId) {
		String title = "";
		switch (method) {
		case "add":
			title = "版本新增";
			break;
		case "edit":
			title = "版本编辑";
			break;
		case "detail":
			title = "版本详情";
			break;
		}
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("method", method);
		
		if (versionId != null) {
			VersionEntity version = versionService.findOne(versionId);
			modelMap.addAttribute("version", version);
		}
		
		return "pages/authority/version_add";
	}
	
	@RequestMapping(value = "/versionHistory")
	String version(ModelMap modelMap) {
		List<VersionEntity> versionList = versionService.list();
		modelMap.addAttribute("versionList", versionList);
		return "pages/authority/version_history";
	}
	
	@RequestMapping(value = "/authority/business")
	String business(ModelMap modelMap) {
		return "pages/authority/business";
	}
	
	/**
	 * 基础数据接口
	 */
	@RequestMapping(value = "/area")
	String area(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/base/area";
	}
	
	@RequestMapping(value = "/industry")
	String industry(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/base/industry";
	}
	
	@RequestMapping(value = "/appealType")
	String appealType(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		return "pages/base/appealType";
	}
	
	/**
	 * 新闻发布接口
	 */
	@RequestMapping(value = "/articleList")
	String articleList(ModelMap modelMap, Integer type) {
		String title = articleService.getArticleTitle(type);
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("type", type);
		
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		
		return "pages/issue/article_list";
	}
	
	@RequestMapping(value = "/articleAdd")
	String articleAdd(ModelMap modelMap, Integer type, String method, Long articleId) throws IOException {
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("method", method);
		
		String title = articleService.getArticleTitle(type);
		title += method.equals("add") ? " - 新增" : " - 编辑";
		modelMap.addAttribute("title", title);
		
		if (articleId != null) {
			ArticleEntity article = articleService.findOne(articleId);
			modelMap.addAttribute("article", article);
		}
		
		return "pages/issue/article_add";
	}
	
	@RequestMapping(value = "/articleGet/{articleId}")
	String articleGet(ModelMap modelMap, @PathVariable("articleId") Long articleId) throws IOException {
		ArticleEntity article = articleService.findOne(articleId);
		if (article != null) {
			modelMap.addAttribute("article", article);
			String title = articleService.getArticleTitle(article.getType());
			modelMap.addAttribute("title", title);
		}
		return "pages/issue/article_get";
	}
	
	/**
	 * 监测平台接口
	 */
	@RequestMapping(value = "/targetReport")
	String targetImport(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("role", user.getRole());
		
		return "pages/monitor/target_report";
	}
	
	@RequestMapping(value = "/targetEP")
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
	
	@RequestMapping(value = "/targetEnterprise")
	String targetEnterprise() {
		return "pages/monitor/target_enterprise";
	}
	
	@RequestMapping(value = "/targetIndustry")
	String targetIndustry() {
		return "pages/monitor/target_industry";
	}
	
	@RequestMapping(value = "/targetArea")
	String targetArea() {
		return "pages/monitor/target_area";
	}
	
	@RequestMapping(value = "/targetPointEnterprise")
	String targetPointEnterprise() {
		return "pages/monitor/target_point_enterprise";
	}
		
	/**
	 * 帮扶平台接口
	 */
	@RequestMapping(value = "/appealDispatcher")
	String appealDispatcher(ModelMap modelMap) {
		List<DepartmentEntity> departmentList = departmentService.list();
		modelMap.addAttribute("departmentList", departmentList);
		return "pages/assist/appeal_dispatcher";
	}
	
	@RequestMapping(value = "/appealEnterprise")
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
	
	@RequestMapping(value = "/appealDepartment")
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
	
	@RequestMapping(value = "/appealList")
	String appealList() {
		return "pages/assist/appeal_list";
	}
	
	@RequestMapping(value = "/appealAdd")
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
	
	@RequestMapping(value = "/appealGet")
	String appealGet(ModelMap modelMap, Long appealId) {
		AppealEntity appeal = appealService.findOne(appealId);
		modelMap.addAttribute("appeal", appeal);
		
		return "pages/assist/appeal_get";
	}
	
	/**
	 * 服务平台接口
	 */
	@RequestMapping(value = "/supplierApply")
	String supplierApply(ModelMap modelMap, Integer type) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("userId", user.getId());
		modelMap.addAttribute("type", type);
		modelMap.addAttribute("professions", ConstantUtil.professions);
		modelMap.addAttribute("propertys", ConstantUtil.propertys);
		modelMap.addAttribute("scales", ConstantUtil.scales);
		return "pages/service/supplier_apply";
	}
	
	@RequestMapping(value = "/platformTalent")
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
	
	@RequestMapping(value = "/platformInformation")
	String platformBusiness(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		SupplierEntity supplier = supplierService.findByUserIdAndType(user.getId(), SupplierType.TYPE_INFORMATION);
		modelMap.addAttribute("supplier", supplier);
		modelMap.addAttribute("userId", user.getId());
		return "pages/service/platform_information";
	}
	
	@RequestMapping(value = "/platformFinancing")
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
	
	@RequestMapping(value = "/platformLogistics")
	String platformLogistics(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		SupplierEntity supplier = supplierService.findByUserIdAndType(user.getId(), SupplierType.TYPE_LOGISITCS);
		modelMap.addAttribute("supplier", supplier);
		modelMap.addAttribute("userId", user.getId());
		
		modelMap.addAttribute("transportModes", ConstantUtil.transportModes);
		return "pages/service/platform_logistics";
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
	 * 日常办公
	 */
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
			String content = commonService.getMailContent(mail.getPath());
			mail.setContent(content);
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
		
		String content = commonService.getMailContent(mail.getPath());
		mail.setContent(content);
		modelMap.addAttribute("mail", mail);
		
		return "pages/office/mail_get";
	}
	
	/**
	 * 个人中心
	 */
	@RequestMapping(value = "/personalInfo")
	String personalInfo(ModelMap modelMap) {
		UserEntity currentUser = CurrentUserUtils.getInstance().getUser();
		UserEntity user = userService.findOne(currentUser.getId());
		modelMap.addAttribute("user", user);
		return "pages/personal/info";
	}
	
	@RequestMapping(value = "/modifyPassword")
	String modifyPassword(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "pages/personal/modify_password";
	}
	
	@RequestMapping(value = "/personalEnterprise")
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
	
	@RequestMapping(value = "/loginHistory")
	String loginHistory(ModelMap modelMap) {
		UserEntity user = CurrentUserUtils.getInstance().getUser();
		modelMap.addAttribute("user", user);
		return "pages/personal/login_history";
	}

}

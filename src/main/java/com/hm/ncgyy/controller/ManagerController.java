package com.hm.ncgyy.controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.NewsEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.entity.base.AppealTypeEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.entity.issue.ArticleEntity;
import com.hm.ncgyy.entity.service.ApplyEntity;
import com.hm.ncgyy.entity.service.DeclareEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.assist.AppealService;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.NewsService;
import com.hm.ncgyy.service.authority.ProductService;
import com.hm.ncgyy.service.authority.RoleService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.base.AppealTypeService;
import com.hm.ncgyy.service.base.AreaService;
import com.hm.ncgyy.service.base.IndustryService;
import com.hm.ncgyy.service.issue.ArticleService;
import com.hm.ncgyy.service.service.ApplyService;
import com.hm.ncgyy.service.service.DeclareService;

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
	DeclareService declareService;
	
	@Autowired
	ApplyService applyService;

	@Autowired
	AppealService appealService;
	
	@Autowired
	AppealTypeService appealTypeService;
	
	/**
	 * 用户接口
	 */
	@RequestMapping(value = "/userList")
	String userList() {
		return "pages/authority/user_list";
	}
	
	@RequestMapping(value = "/userAdd")
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
	String enterpriseList() {
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
	String enterpriseGet(ModelMap modelMap, Long enterpriseId) {
		EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
		modelMap.addAttribute("enterprise", enterprise);
		
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
	String department() {
		return "pages/authority/department";
	}
	
	/**
	 * 基础数据接口
	 */
	@RequestMapping(value = "/area")
	String area() {
		return "pages/base/area";
	}
	
	@RequestMapping(value = "/industry")
	String industry() {
		return "pages/base/industry";
	}
	
	@RequestMapping(value = "/appealType")
	String appealType() {
		return "pages/base/appealType";
	}
	
	/**
	 * 监测平台接口
	 */
	@RequestMapping(value = "/targetImport")
	String targetImport() {
		return "pages/monitor/target_import";
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
		modelMap.addAttribute("enterpriseId", 2);
		return "pages/assist/appeal_enterprise";
	}
	
	@RequestMapping(value = "/appealDepartment")
	String appealDepartment() {
		return "pages/assist/appeal_department";
	}
	
	@RequestMapping(value = "/appealList")
	String appealList() {
		return "pages/assist/appeal_list";
	}
	
	@RequestMapping(value = "/appealAdd")
	String appealAdd(ModelMap modelMap, String method, Long appealId) {
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
	@RequestMapping(value = "/declareGV")
	String declareGV() {
		return "pages/service/declare_gv";
	}
	
	@RequestMapping(value = "/declareEP")
	String declareEP() {
		return "pages/service/declare_ep";
	}
	
	@RequestMapping(value = "/declareAdd")
	String declareAdd(ModelMap modelMap, String method, Long declareId) {
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
	 * 新闻发布接口
	 */
	@RequestMapping(value = "/articleList")
	String articleList(ModelMap modelMap, Integer type) {
		String title = articleService.getArticleTitle(type);
		modelMap.addAttribute("title", title);
		modelMap.addAttribute("type", type);
		
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
			String content = commonService.getArticleContent(article.getPath());
			article.setContent(content);
			modelMap.addAttribute("article", article);
		}
		
		return "pages/issue/article_add";
	}
	
	@RequestMapping(value = "/articleGet/{path}")
	String articleGet(ModelMap modelMap, @PathVariable("path") String path) throws IOException {
		ArticleEntity article = articleService.findByPath(path);
		if (article != null) {
			String content = commonService.getArticleContent(article.getPath());
			article.setContent(content);
			modelMap.addAttribute("article", article);
			
			String title = articleService.getArticleTitle(article.getType());
			modelMap.addAttribute("title", title);
		}
		
		return "pages/issue/article_get";
	}

}

package com.hm.ncgyy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.utils.CiphersUtils;
import com.hm.ncgyy.common.utils.FileUtil;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.entity.base.AppealTypeEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.RoleService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.base.AppealTypeService;
import com.hm.ncgyy.service.base.AreaService;
import com.hm.ncgyy.service.base.IndustryService;

@RestController
public class InitController {
	
	static Logger log = LoggerFactory.getLogger(InitController.class);
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	IndustryService industryService;
	
	@Autowired
	AppealTypeService appealTypeService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	HttpServletRequest request;
	
	@Value("${customize.admin.username}")
	private String adminUsername;

	@Value("${customize.admin.password}")
	private String adminPassword;
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@Value("${customize.path.avatar}")
	private String avatarPath;
	
	@RequestMapping(value = "/api/init/role")
	public Result role() {
		try {
			Date now = new Date();
			RoleEntity role = roleService.findByName("管理员");
			if (role == null) {
				String resource = "authority-role,authority-role-add,authority-role-delete-batch,authority-role-detail,authority-role-edit";
				role = new RoleEntity("管理员", "管理员", resource, now, now);
				roleService.save(role);
			}
			
			RoleEntity userRole = roleService.findByName("普通用户");
			if (userRole == null) {
				userRole = new RoleEntity("普通用户", "普通用户", "", now, now);
				roleService.save(userRole);
			}
			 
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/init/admin")
	public Result admin() {
		try {
			Date now = new Date();
			UserEntity user = userService.findByUsername(adminUsername);
			if (user == null) {
				RoleEntity role = roleService.findByName("管理员");
				user = new UserEntity(adminUsername, CiphersUtils.getInstance().MD5Password(adminPassword), 
					role, "", now, now);
				user.setName(adminUsername);
				userService.save(user);
			}
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/init/avatar")
	public Result avatar() {
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			String[] pics = new String[] { "default_user.png", "default_enterprise.png" };
			for (String name: pics) {
				File file = Paths.get(uploadPath, avatarPath, name).toFile();
				if (file.exists()) {
					continue;
				}
				
				FileInputStream in = new FileInputStream(new File(root + "/init/" + name));
				FileUtil.sureDirExists(file, true);
				
				FileOutputStream out = new FileOutputStream(file);
	            IOUtils.copy(in, out);
	            out.close();
			}
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/init/area")
	public Result area() {
		try {
			Date now = new Date();
			String[] list = new String[] { "金山口工业园", "河东工业园", "南城工业园" };
			for (String name : list) {
				AreaEntity area = areaService.findByName(name);
				if (area == null) {
					area = new AreaEntity(name, name, now, now);
					areaService.save(area);
				}
			}
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/init/industry")
	public Result industry() {
		try {
			Date now = new Date();
			String[] list = new String[] { "食品加工", "纺织服装", "电子信息", "机械制造", "铜加工", "化工", "医药", "其它" };
			for (String name : list) {
				IndustryEntity industry = industryService.findByName(name);
				if (industry == null) {
					industry = new IndustryEntity(name, now, now);
					industryService.save(industry);
				}
			}
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/init/appealType")
	public Result appealType() {
		try {
			Date now = new Date();
			String[] list = new String[] { "资金问题", "用工问题", "社会保险", "人才招聘难", "三乱问题", "用电问题", "用水问题", "用地问题", "物流成本高",
					"产业链配套问题", "政策优惠问题", "其他问题" };
			for (String name : list) {
				AppealTypeEntity type = appealTypeService.findByName(name);
				if (type == null) {
					type = new AppealTypeEntity(name, 5, 10, now, now);
					appealTypeService.save(type);
				}
			}
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	private HSSFWorkbook workbook;
	
	@RequestMapping(value = "/api/init/enterprise")
	public Result enterprise() {
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			File file = new File(root + "/init/enterpriseName.xls");
			
			workbook = new HSSFWorkbook(new FileInputStream(file));
			HSSFSheet sheet = workbook.getSheetAt(0);
			
			for (int i = 1; i < sheet.getLastRowNum(); i++) {
				HSSFRow row = sheet.getRow(i);
				if (null == row) {
					continue;
				}
				
				String name = row.getCell(1).getStringCellValue();
				
				EnterpriseEntity enterprise = new EnterpriseEntity();
				enterprise.setName(name);
				
				AreaEntity area = areaService.findByName("南城工业园");
				enterprise.setArea(area);
				
				IndustryEntity industry = industryService.findByName("机械制造");
				enterprise.setIndustry(industry);
				
				enterpriseService.save(enterprise);
			}
			
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/init/department")
	public Result department() {
		try {
			Date now = new Date();
			String[] list = new String[] { "环保局", "商务局", "县物流产业发展局", "县安监局", "园区", "交通局", "审计局" };
			for (String name : list) {
				DepartmentEntity department = departmentService.findByName(name);
				if (department == null) {
					department = new DepartmentEntity(name, name, name, now, now);
					departmentService.save(department);
				}
			}
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

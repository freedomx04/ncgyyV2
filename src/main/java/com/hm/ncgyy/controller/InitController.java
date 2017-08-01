package com.hm.ncgyy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFPictureData;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFShape;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.PathFormat;
import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.utils.CiphersUtils;
import com.hm.ncgyy.common.utils.FileUtil;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.ProductEntity;
import com.hm.ncgyy.entity.authority.RoleEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.entity.base.AppealTypeEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.ProductService;
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
	ProductService productService;
	
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
	
	@RequestMapping(value = "/api/init/enterpriseName")
	public Result enterpriseName() {
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			File file = new File(root + "/init/enterpriseName.xls");
			
			workbook = new HSSFWorkbook(new FileInputStream(file));
			HSSFSheet sheet = workbook.getSheetAt(0);
			
			for (int i = 0; i <= sheet.getLastRowNum(); i++) {
				HSSFRow row = sheet.getRow(i);
				if (null == row) {
					continue;
				}
				
				String name = row.getCell(0).getStringCellValue();
				EnterpriseEntity enterprise = enterpriseService.findByName(name);
				if (enterprise == null) {
					enterprise = new EnterpriseEntity();
					enterprise.setName(name);
					
					AreaEntity area = areaService.findByName("南城工业园");
					enterprise.setArea(area);
					
					IndustryEntity industry = industryService.findByName("机械制造");
					enterprise.setIndustry(industry);
					
					enterpriseService.save(enterprise);
				}
			}
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@Value("${customize.path.image}")
	private String imageFormat;
	
	@RequestMapping(value = "/api/init/enterpriseDetail")
	public Result enterpriseDetail() throws IOException {
		String sheetName = null;
		
		try {
			HashMap<String, HSSFPictureData> picMap = new HashMap<>();
			Date now = new Date();
			DecimalFormat df = new DecimalFormat("0");
			
			String root = request.getSession().getServletContext().getRealPath("/");
			File file = new File(root + "/init/enterpriseDetail.xls");
			
			workbook = new HSSFWorkbook(new FileInputStream(file));
			
			for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
				HSSFSheet sheet = workbook.getSheetAt(i);
				sheetName = sheet.getSheetName();
				
				// 获取所有图片
				List<HSSFPictureData> pictures = workbook.getAllPictures();
				for (HSSFShape shape : sheet.getDrawingPatriarch().getChildren()) {
					HSSFClientAnchor anchor = (HSSFClientAnchor) shape.getAnchor();

					if (shape instanceof HSSFPicture) {
						HSSFPicture pic = (HSSFPicture) shape;
						String location = anchor.getRow1() + "-" + anchor.getCol1();

						int pictureIndex = pic.getPictureIndex() - 1;
						HSSFPictureData picData = pictures.get(pictureIndex);

						picMap.put(location, picData);
					}
				}
				
				HSSFCell cell = null;
				// 企业名称
				cell = sheet.getRow(1).getCell(1);
				String name = cell.getStringCellValue().trim();
				
				EnterpriseEntity enterprise = enterpriseService.findByName(name);
				if (enterprise == null) {
					enterprise = new EnterpriseEntity();
					enterprise.setName(name);
					enterprise.setCreateTime(now);
					enterprise.setUpdateTime(now);
				}
				
				// 企业地址
				cell = sheet.getRow(2).getCell(1);
				if (cell != null) {
					String address = cell.getStringCellValue().trim();
					enterprise.setAddress(address);
				}
				
				// 所属园区
				AreaEntity area = areaService.findByName("南城工业园");
				enterprise.setArea(area);
				
				// 主要产品
				cell = sheet.getRow(4).getCell(1);
				if (cell != null) {
					String mainProduct = cell.getStringCellValue().trim();
					enterprise.setMainProduct(mainProduct);
				}
				
				// 行业
				IndustryEntity industry = industryService.findByName("机械制造");
				enterprise.setIndustry(industry);
				
				// 投产时间
				cell = sheet.getRow(6).getCell(1);
				if (cell != null) {
					if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						Date productionTime = cell.getDateCellValue();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						enterprise.setProductionTime(sdf.format(productionTime));
					}
				}
				
				// 企业负责人
				cell = sheet.getRow(7).getCell(1);
				if (cell != null) {
					String principal = cell.getStringCellValue().trim();
					enterprise.setPrincipal(principal);
				}
				
				// 联系电话
				cell = sheet.getRow(9).getCell(1);
				if (cell != null) {
					String telephone = null;
					if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						telephone = df.format(cell.getNumericCellValue());
					} else {
						telephone = cell.getStringCellValue().trim();
					}
					enterprise.setTelephone(telephone);
				}
				
				// 企业法人
				cell = sheet.getRow(10).getCell(1);
				if (cell != null) {
					String representative = cell.getStringCellValue().trim();
					enterprise.setRepresentative(representative);
				}
				
				// 主要股东
				cell = sheet.getRow(11).getCell(1);
				if (cell != null) {
					String shareholder = cell.getStringCellValue().trim();
					enterprise.setShareholder(shareholder);
				}
				
				// 注册资金
				cell = sheet.getRow(12).getCell(1);
				if (cell != null) {
					String registeredCapital = cell.getStringCellValue().trim();
					enterprise.setRegisteredCapital(registeredCapital);
				}
				
				// 主要变更记录
				cell = sheet.getRow(13).getCell(1);
				if (cell != null) {
					String alterRecording = cell.getStringCellValue().trim();
					enterprise.setAlterRecording(alterRecording);
				}
				
				// 国税识别码
				cell = sheet.getRow(15).getCell(1);
				if (cell != null) {
					String nationalTax = "";
					if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						nationalTax = String.valueOf(cell.getNumericCellValue());
					} else {
						nationalTax = cell.getStringCellValue().trim();
					}
					enterprise.setNationalTax(nationalTax);
				}
				
				// 地税识别码
				cell = sheet.getRow(17).getCell(1);
				if (cell != null) {
					String localTax = "";
					if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						localTax = String.valueOf(cell.getNumericCellValue());
					} else {
						localTax = cell.getStringCellValue().trim();
					}
					enterprise.setLocalTax(localTax);
				}
				
				// 保存企业
				enterpriseService.save(enterprise);
				
				EnterpriseBaseEntity base = enterpriseService.findOneBase(enterprise.getId());
				
				// 企业产品
				HSSFRow row = sheet.getRow(21);
				for (int k = 1; k < row.getLastCellNum(); k++) {
					ProductEntity product = new ProductEntity();

					// 产品名称
					cell = sheet.getRow(21).getCell(k);
					if (cell != null) {
						String productName = cell.getStringCellValue().trim();
						if (productName.equals("")) {
							continue;
						}
						product.setName(productName);
					}

					// 产品图片
					String location = "22-" + k;
					HSSFPictureData pic = picMap.get(location);

					if (pic != null) {
						String ext = pic.suggestFileExtension();
						byte[] data = pic.getData();

						String suffix = ".png";
						switch (ext) {
						case "jpeg":
							suffix = ".jpg";
							break;
						case "png":
							suffix = ".png";
							break;
						default:
							break;
						}
						
						String tarPath = imageFormat + suffix;
						tarPath = PathFormat.parse(tarPath);

						File imagefile = Paths.get(uploadPath, tarPath).toFile();
						FileUtil.sureDirExists(imagefile, true);

						FileOutputStream out = new FileOutputStream(imagefile);
						out.write(data);
						out.close();

						product.setImagePath(tarPath);
					}

					// 规格参数
					cell = sheet.getRow(24).getCell(k);
					if (cell != null) {
						String specification = cell.getStringCellValue();
						product.setSpecification(specification);
					}

					// 产品介绍
					cell = sheet.getRow(25).getCell(k);
					if (cell != null) {
						String introduction = cell.getStringCellValue().trim();
						product.setIntroduction(introduction);
					}

					product.setEnterprise(base);
					product.setCreateTime(now);
					product.setUpdateTime(now);
					productService.save(product);
				}
			}
			
			return new Result(Code.SUCCESS.value(), "成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			
			File errorFile = new File("G://error.txt");
			FileUtil.writeInfo(errorFile, sheetName + "-->" + e.getMessage(), true);
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

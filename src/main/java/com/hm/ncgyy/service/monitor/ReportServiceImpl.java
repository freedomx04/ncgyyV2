package com.hm.ncgyy.service.monitor;

import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hm.ncgyy.common.utils.FormulaUtils;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.entity.monitor.TargetEntity;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.base.AreaService;
import com.hm.ncgyy.service.base.IndustryService;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	TargetService targetService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	IndustryService industryService;
	
	@Autowired
	AreaService areaService;
	
	/**
	 * 导出类型
	 */
	public class ExportType {
		public static final int TARGET_ENTERPRISE = 1;			// 企业主要指标
		public static final int TARGET_INDUSTRY = 2;			// 行业主要指标
		public static final int TARGET_AREA = 3;				// 园区主要指标
		public static final int TARGET_ENTERPRISE_MONTHLY = 4;	// 指定企业主要指标
	}
	
	/**
	 * excel栏位
	 */
	@SuppressWarnings("serial")
	public static HashMap<String, ExcelCell> excelCell = new HashMap<String, ExcelCell>() {{
		put("monthly",			new ExcelCell("monthly", 			4500, 	"月报表时间"));
		put("enterprise",		new ExcelCell("enterprise", 		8000, 	"企业名称"));
		put("industry",			new ExcelCell("industry", 			4500, 	"行业类别"));
		put("area",				new ExcelCell("area",				4500,	"园区名称"));
		put("lastYear", 		new ExcelCell("lastYear", 			4500, 	"去年同期"));
		put("lastMonth",		new ExcelCell("lastMonth", 			4500, 	"上月同期"));
		put("lastYear_growth", 	new ExcelCell("lastYear_growth", 	3000, 	"同比增幅%"));
		put("lastMonth_growth", new ExcelCell("lastMonth_growth", 	3000, 	"环比增幅%"));
		
		// target
		put("mainBusiness", 	new ExcelCell("mainBusiness",		4500, 	"本月止主营业务收入(万元)"));
		put("electricity", 		new ExcelCell("electricity", 		4500, 	"本月止用电量(万度)"));
		put("profit", 			new ExcelCell("profit", 			4500, 	"本月止利润总额(万元)"));
		put("tax", 				new ExcelCell("tax", 				4500, 	"本月止实现税金总额(万元)"));
	}};
	
	/**
	 * 导出栏位
	 */
	@SuppressWarnings("serial")
	public static HashMap<Integer, String> exportColumn = new HashMap<Integer, String>() {{
		put(ExportType.TARGET_ENTERPRISE, "monthly, enterprise, "
				+ "mainBusiness, lastYear, lastYear_growth, electricity, lastYear, lastYear_growth, "
				+ "profit, lastYear, lastYear_growth, tax, lastYear, lastYear_growth");
		put(ExportType.TARGET_INDUSTRY, "monthly, productType, "
				+ "mainBusiness, lastYear, lastYear_growth, electricity, lastYear, lastYear_growth, "
				+ "profit, lastYear, lastYear_growth, tax, lastYear, lastYear_growth");
		put(ExportType.TARGET_AREA, "monthly, area, "
				+ "mainBusiness, lastYear, lastYear_growth, electricity, lastYear, lastYear_growth, "
				+ "profit, lastYear, lastYear_growth, tax, lastYear, lastYear_growth");
		put(ExportType.TARGET_ENTERPRISE_MONTHLY, "monthly, enterprise, "
				+ "mainBusiness, lastYear, lastYear_growth, electricity, lastYear, lastYear_growth, "
				+ "profit, lastYear, lastYear_growth, tax, lastYear, lastYear_growth");
	}};
	
	@Override
	public HSSFWorkbook createTemplate(String monthly) {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");
		
		// 创建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		// 设置标题 
		HSSFRow titleRow = sheet.createRow(0);
		titleRow.setHeight((short) 300);// 设定行的高度
		String[] titles = StringUtils.split("monthly, enterprise, mainBusiness, electricity, profit, tax", ",");
		for (int i = 0; i < titles.length; i++) {
			String title = titles[i].trim();
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellStyle(style);
			sheet.setColumnWidth(i, excelCell.get(title).getWidth());
			cell.setCellValue(excelCell.get(title).getTitle());
		}
		
		// 企业列表
		List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
		int colnum = 1;
		for (EnterpriseBaseEntity enterprise: enterpriseList) {
			HSSFRow row = sheet.createRow(colnum);
			row.setHeight((short) 300);
			row.createCell(0).setCellValue(monthly);
			row.createCell(1).setCellValue(enterprise.getName());
			colnum++;
		}
		
		return wb;
	}

	@SuppressWarnings("resource")
	@Override
	public void importTarget(InputStream is) throws Exception {
		HSSFWorkbook wb = new HSSFWorkbook(is);
		HSSFSheet sheet = wb.getSheetAt(0);
		
		HSSFCell cell = null;
		for (int i =1; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (null == row) {
				continue;
			}
			
			String monthly = row.getCell(0).getStringCellValue();
			String enterpriseName = row.getCell(1).getStringCellValue();
			
			EnterpriseBaseEntity enterprise = enterpriseService.findByNameBase(enterpriseName);
			if (enterprise == null) {
				continue;
			}
			
			double mainBusiness = 0;
			double electricity = 0;
			double profit = 0;
			double tax = 0;
			
			cell = row.getCell(2);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				mainBusiness = cell.getNumericCellValue();
			}
			
			cell = row.getCell(3);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				electricity = cell.getNumericCellValue();
			}
			
			cell = row.getCell(4);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				profit = cell.getNumericCellValue();
			}
			
			cell = row.getCell(5);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				tax = cell.getNumericCellValue();
			}
			
			TargetEntity target = targetService.findOne(monthly, enterprise.getId());
			if (target != null) {
				target.setMainBusiness(mainBusiness);
				target.setElectricity(electricity);
				target.setProfit(profit);
				target.setTax(tax);
				target.setUpdateTime(new Date());
				targetService.save(target);
			} else {
				Date now = new Date();
				target = new TargetEntity(monthly, enterprise, mainBusiness, electricity, profit, tax, now, now);
				targetService.save(target);
			}
		}
	}

	@Override
	public HSSFWorkbook export(String monthly, Integer type) throws Exception {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");
		
		// 创建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		HSSFRow titleRow = sheet.createRow(0);
		titleRow.setHeight((short) 300);// 设定行的高度
		
		String[] titles = StringUtils.split(exportColumn.get(type), ",");
		for (int i = 0; i < titles.length; i++) {
			String title = titles[i].trim();
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellStyle(style);
			sheet.setColumnWidth(i, excelCell.get(title).getWidth());
			cell.setCellValue(excelCell.get(title).getTitle());
		}
		
		List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
		List<IndustryEntity> industryList = industryService.list();
		List<AreaEntity> areaList = areaService.list();
		int colnum = 1;
		
		switch (type) {
		case ExportType.TARGET_ENTERPRISE:
			for (EnterpriseBaseEntity enterprise: enterpriseList) {
				TargetVO target = targetService.detail(monthly, enterprise);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeTarget(row, target);
				colnum++;
			}
			break;
		case ExportType.TARGET_INDUSTRY:
			for (IndustryEntity industry: industryList) {
				List<EnterpriseBaseEntity> enterprises = enterpriseService.listByIndustryId(industry.getId());
				TargetVO target = targetService.sumEnterpriseTarget(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(industry.getName());
				
				writeTarget(row, target);
				colnum++;
			}
			break;
		case ExportType.TARGET_AREA:
			for (AreaEntity area: areaList) {
				List<EnterpriseBaseEntity> enterprises = enterpriseService.listByAreaId(area.getId());
				TargetVO target = targetService.sumEnterpriseTarget(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(area.getName());
				
				writeTarget(row, target);
				colnum++;
			}
			break;
		default:
			break;
		}
		
		return wb;
	}

	@Override
	public HSSFWorkbook export(EnterpriseBaseEntity enterprise) throws Exception {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");
		
		// 创建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		HSSFRow titleRow = sheet.createRow(0);
		titleRow.setHeight((short) 300);// 设定行的高度
		String[] titles = StringUtils.split(exportColumn.get(ExportType.TARGET_ENTERPRISE_MONTHLY), ",");
		for (int i = 0; i < titles.length; i++) {
			String title = titles[i].trim();
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellStyle(style);
			sheet.setColumnWidth(i, excelCell.get(title).getWidth());
			cell.setCellValue(excelCell.get(title).getTitle());
		}
		
		int colnum = 1;
		
		List<TargetEntity> targetList = targetService.list(enterprise.getId());
		for (TargetEntity entity: targetList) {
			TargetVO target = targetService.detail(entity);
			
			HSSFRow row = sheet.createRow(colnum);
			row.setHeight((short) 300);
			row.createCell(0).setCellValue(entity.getMonthly());
			row.createCell(1).setCellValue(enterprise.getName());
			
			writeTarget(row, target);
			colnum++;
		}
		
		return wb;
	}
	
	public void writeTarget(HSSFRow row, TargetVO target) {
		TargetEntity target_current = target.getTarget_current();
		if (target_current != null) {
			row.createCell(2).setCellValue(target_current.getMainBusiness());
			row.createCell(5).setCellValue(target_current.getMainBusiness());
			row.createCell(8).setCellValue(target_current.getMainBusiness());
			row.createCell(11).setCellValue(target_current.getMainBusiness());
		} else {
			row.createCell(2).setCellValue("-");
			row.createCell(5).setCellValue("-");
			row.createCell(8).setCellValue("-");
			row.createCell(11).setCellValue("-");
		}
		
		TargetEntity target_lastYear = target.getTarget_lastYear();
		if (target_lastYear != null) {
			row.createCell(3).setCellValue(target_lastYear.getMainBusiness());
			row.createCell(6).setCellValue(target_lastYear.getMainBusiness());
			row.createCell(9).setCellValue(target_lastYear.getMainBusiness());
			row.createCell(11).setCellValue(target_lastYear.getMainBusiness());
		} else {
			row.createCell(3).setCellValue("-");
			row.createCell(6).setCellValue("-");
			row.createCell(9).setCellValue("-");
			row.createCell(12).setCellValue("-");
		}
		
		String mainBusiness_yearGrowth = target.getMainBusiness_yearGrowth();
		if (mainBusiness_yearGrowth != null) {
			row.createCell(4).setCellValue(FormulaUtils.convertPercent(mainBusiness_yearGrowth));
		} else {
			row.createCell(4).setCellValue("-");
		}
		
		String electricity_yearGrowth = target.getElectricity_yearGrowth();
		if (electricity_yearGrowth != null) {
			row.createCell(7).setCellValue(FormulaUtils.convertPercent(electricity_yearGrowth));
		} else {
			row.createCell(7).setCellValue("-");
		}
		
		String profit_yearGrowth = target.getProfit_yearGrowth();
		if (profit_yearGrowth != null) {
			row.createCell(10).setCellValue(FormulaUtils.convertPercent(profit_yearGrowth));
		} else {
			row.createCell(10).setCellValue("-");
		}
		
		String tax_yearGrowth = target.getTax_yearGrowth();
		if (tax_yearGrowth != null) {
			row.createCell(13).setCellValue(FormulaUtils.convertPercent(tax_yearGrowth));
		} else {
			row.createCell(13).setCellValue("-");
		}
	}

}

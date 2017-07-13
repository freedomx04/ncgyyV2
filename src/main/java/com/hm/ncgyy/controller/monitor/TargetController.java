package com.hm.ncgyy.controller.monitor;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.common.utils.FormulaUtils;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.entity.monitor.TargetEntity;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.base.AreaService;
import com.hm.ncgyy.service.base.IndustryService;
import com.hm.ncgyy.service.monitor.ReportService;
import com.hm.ncgyy.service.monitor.TargetService;
import com.hm.ncgyy.service.monitor.TargetVO;

import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

@RestController
public class TargetController {

	static Logger log = LoggerFactory.getLogger(TargetController.class);

	@Autowired
	TargetService targetService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	AreaService areaService;

	@Autowired
	IndustryService industryService;
	
	@Autowired
	ReportService reportService;

	@RequestMapping(value = "/api/target/create", method = RequestMethod.POST)
	public Result create(String monthly, Long enterpriseId, double mainBusiness, double electricity, double profit,
			double tax) {
		try {
			TargetEntity target = targetService.findOne(monthly, enterpriseId);
			if (target != null) {
				return new Result(Code.EXISTED.value(), "添加失败，该月份记录已存在!");
			}

			EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			Date now = new Date();
			target = new TargetEntity(monthly, enterprise, mainBusiness, electricity, profit, tax, now, now);
			targetService.save(target);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/update", method = RequestMethod.POST)
	public Result update(Long targetId, double mainBusiness, double electricity, double profit, double tax) {
		try {
			TargetEntity target = targetService.findOne(targetId);
			target.setMainBusiness(mainBusiness);
			target.setElectricity(electricity);
			target.setProfit(profit);
			target.setTax(tax);
			target.setUpdateTime(new Date());
			targetService.save(target);

			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/delete")
	public Result delete(Long targetId) {
		try {
			targetService.delete(targetId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/target/batchDelete")
	public Result batchDelete(@RequestParam("targetIdList[]") List<Long> targetIdList) {
		try {
			targetService.delete(targetIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/get")
	public Result get(Long targetId) {
		try {
			TargetEntity target = targetService.findOne(targetId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", target);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listByMonthly")
	public Result listByMonthly(String monthly) {
		try {
			List<TargetVO> list = new LinkedList<>();

			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
			for (EnterpriseBaseEntity enterprise : enterpriseList) {
				list.add(targetService.detail(monthly, enterprise));
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listByEnterpriseId")
	public Result listByEnterpriseId(Long enterpriseId) {
		try {
			List<TargetVO> list = new LinkedList<>();

			List<TargetEntity> targets = targetService.list(enterpriseId);
			for (TargetEntity target : targets) {
				list.add(targetService.detail(target));
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listByIndustry")
	public Result listByIndustry(String monthly) {
		try {
			List<TargetVO> list = new LinkedList<>();

			List<IndustryEntity> industryList = industryService.list();
			for (IndustryEntity industry : industryList) {
				List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listByIndustryId(industry.getId());
				TargetVO ret = targetService.sumEnterpriseTarget(monthly, enterpriseList);
				ret.setIndustry(industry);
				list.add(ret);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listByArea")
	public Result listByArea(String monthly) {
		try {
			List<TargetVO> list = new LinkedList<>();

			List<AreaEntity> areaList = areaService.list();
			for (AreaEntity area : areaList) {
				List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
				TargetVO ret = targetService.sumEnterpriseTarget(monthly, enterpriseList);
				ret.setArea(area);
				list.add(ret);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listByMonthlyRange")
	public Result listByMonthlyRange(Long enterpriseId, String monthlyStart, String monthlyEnd) {
		try {
			List<TargetVO> list = new LinkedList<>();

			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			List<TargetEntity> targets = targetService.listByMonthlyInAndEnterpriseId(monthlyList, enterpriseId);
			for (TargetEntity target : targets) {
				list.add(targetService.detail(target));
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listRange")
	public Result listRange(String monthlyStart, String monthlyEnd) {
		try {
			List<TargetVO> list = new LinkedList<>();

			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TargetVO ret = targetService.sumEnterpriseTarget(monthly, enterpriseList);
				list.add(ret);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listByEnterpriseIdRange")
	public Result listByEnterpriseIdRange(Long enterpriseId, String monthlyStart, String monthlyEnd) {
		try {
			List<TargetVO> list = new LinkedList<>();

			EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			List<EnterpriseBaseEntity> enterpriseList = new LinkedList<>();
			enterpriseList.add(enterprise);

			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TargetVO ret = targetService.detail(monthly, enterprise);
				list.add(ret);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listByIndustryIdRange")
	public Result listByIndustryIdRange(Long industryId, String monthlyStart, String monthlyEnd) {
		try {
			List<TargetVO> list = new LinkedList<>();

			IndustryEntity industry = industryService.findOne(industryId);
			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listByIndustryId(industryId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TargetVO ret = targetService.sumEnterpriseTarget(monthly, enterpriseList);
				ret.setIndustry(industry);
				list.add(ret);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listByAreaIdRange")
	public Result listByAreaIdRange(Long areaId, String monthlyStart, String monthlyEnd) {
		try {
			List<TargetVO> list = new LinkedList<>();

			AreaEntity area = areaService.findOne(areaId);
			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TargetVO ret = targetService.sumEnterpriseTarget(monthly, enterpriseList);
				ret.setArea(area);
				list.add(ret);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/target/listPointEnterpriseRange")
	public Result listPointEnterpriseRange(String monthlyStart, String monthlyEnd) {
		try {
			List<TargetVO> list = new LinkedList<>();

			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listPoint();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TargetVO ret = targetService.sumEnterpriseTarget(monthly, enterpriseList);
				list.add(ret);
			}

			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/target/template")
	public ResponseEntity<InputStreamResource> template(String monthly) {
		try {
			HSSFWorkbook book = reportService.createTemplate(monthly);
            String fileName = monthly + "主要指标模板.xls";

            HttpHeaders headers = new HttpHeaders();
            headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
            headers.add("Content-Disposition",
                    String.format("attachment; filename=\"%s\"", new String(fileName.getBytes("UTF-8"), "ISO8859-1")));
            headers.add("Pragma", "no-cache");
            headers.add("Expires", "0");

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            book.write(bos);
            byte[] content = bos.toByteArray();
			
			return ResponseEntity.ok().headers(headers).contentLength(content.length)
                    .contentType(MediaType.parseMediaType("application/octet-stream"))
                    .body(new InputStreamResource(new ByteArrayInputStream(content)));
		} catch (Exception e) {
            log.error(e.getMessage(), e);
            return null;
        }
	}
	
	@RequestMapping(value = "/api/target/import", method = RequestMethod.POST)
    public Result importTarget(MultipartFile uploadfile) {
        try {
        	reportService.importTarget(uploadfile.getInputStream());
            return new Result(Code.SUCCESS.value(), "ok");
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Result(Code.ERROR.value(), e.getMessage());
        }
    }
	
	@RequestMapping(value = "/api/target/export")
	public ResponseEntity<InputStreamResource> export(String monthly, Integer type) {
		try {
            HSSFWorkbook book = reportService.export(monthly, type);
            String fileName = monthly + "主要指标.xls";

            HttpHeaders headers = new HttpHeaders();
            headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
            headers.add("Content-Disposition",
                    String.format("attachment; filename=\"%s\"", new String(fileName.getBytes("UTF-8"), "ISO8859-1")));
            headers.add("Pragma", "no-cache");
            headers.add("Expires", "0");

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            book.write(bos);
            byte[] content = bos.toByteArray();

            return ResponseEntity.ok().headers(headers).contentLength(content.length)
                    .contentType(MediaType.parseMediaType("application/octet-stream"))
                    .body(new InputStreamResource(new ByteArrayInputStream(content)));
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return null;
        }
	}
	
	@RequestMapping(value = "/api/target/exportByEnterpriseId")
	public ResponseEntity<InputStreamResource> exportByEnterpriseId(Long enterpriseId) {
		try {
            EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
            HSSFWorkbook book = reportService.export(enterprise);
            String fileName = enterprise.getName() + "企业主要指标明细.xls";

            HttpHeaders headers = new HttpHeaders();
            headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
            headers.add("Content-Disposition",
                    String.format("attachment; filename=\"%s\"", new String(fileName.getBytes("UTF-8"), "ISO8859-1")));
            headers.add("Pragma", "no-cache");
            headers.add("Expires", "0");

            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            book.write(bos);
            byte[] content = bos.toByteArray();

            return ResponseEntity.ok().headers(headers).contentLength(content.length)
                    .contentType(MediaType.parseMediaType("application/octet-stream"))
                    .body(new InputStreamResource(new ByteArrayInputStream(content)));
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return null;
        }
	}

}

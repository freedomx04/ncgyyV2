package com.hm.ncgyy.controller.assist;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.hm.ncgyy.entity.assist.AppealEntity;
import com.hm.ncgyy.entity.assist.AppealEntity.AppealStatus;
import com.hm.ncgyy.entity.assist.EvaluationEntity;
import com.hm.ncgyy.entity.assist.UrgeEntity;
import com.hm.ncgyy.entity.authority.DepartmentEntity;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.base.AppealTypeEntity;
import com.hm.ncgyy.service.assist.AppealService;
import com.hm.ncgyy.service.assist.UrgeService;
import com.hm.ncgyy.service.authority.DepartmentService;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.base.AppealTypeService;

@RestController
public class AppealController {
	
	static Logger log = LoggerFactory.getLogger(AppealController.class);
	
	@Autowired
	AppealService appealService;
	
	@Autowired
	AppealTypeService appealTypeService;
	
	@Autowired
	UrgeService urgeService;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/api/appeal/create", method = RequestMethod.POST)
	public Result create(Long enterpriseId, String title, Long appealTypeId, String description) {
		try {
			EnterpriseBaseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			AppealTypeEntity appealType = appealTypeService.findOne(appealTypeId);
			Date now = new Date();
			AppealEntity appeal = new AppealEntity(enterprise, title, appealType, description, now, now);
			appealService.save(appeal);
			
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/update", method = RequestMethod.POST)
	public Result update(Long appealId, String title, Long appealTypeId, String description) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			AppealTypeEntity appealType = appealTypeService.findOne(appealTypeId);
			appeal.setTitle(title);
			appeal.setAppealType(appealType);
			appeal.setDescription(description);
			appeal.setUpdateTime(new Date());
			appealService.save(appeal);
			
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/delete")
	public Result delete(Long appealId) {
		try {
			appealService.delete(appealId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/get")
	public Result get(Long appealId) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", appeal);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/list")
	public Result list() {
		try {
			List<AppealEntity> list = appealService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/listPaging")
	public Result listPaging(int page, int size) {
		try {
			Page<AppealEntity> list = appealService.listPaging(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * enterprise
	 */
	
	@RequestMapping(value = "/api/appeal/listByEnterprise")
	public Result listByEnterprise(Long enterpriseId) {
		try {
			List<AppealEntity> list = appealService.findByEnterpriseId(enterpriseId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * department
	 */
	
	@RequestMapping(value = "/api/appeal/listByDepartment")
	public Result listByDepartment(Long departmentId) {
		try {
			List<AppealEntity> list = appealService.findByDepartmentId(departmentId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * dispatcher
	 */
	@RequestMapping(value = "/api/appeal/listByDispatcher")
	public Result listByDispatcher() {
		try {
			List<AppealEntity> list = appealService.findByStatus(AppealStatus.SENDING);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * 操作
	 */
	@RequestMapping(value = "/api/appeal/send")
	public Result send(Long appealId) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setStatus(AppealStatus.SENDING);
			appeal.setSendTime(new Date());
			appealService.save(appeal);
			
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/dispatch")
	public Result dispatch(Long appealId, Long departmentId, String dispatchOpinion) {
		try {
			DepartmentEntity department = departmentService.findOne(departmentId);
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setStatus(AppealStatus.PENDING);
			appeal.setDispatchTime(new Date());
			appeal.setDepartment(department);
			appeal.setDispatchOpinion(dispatchOpinion);
			appealService.save(appeal);
			
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/accept")
	public Result accept(Long appealId) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setAcceptTime(new Date());
			appeal.setStatus(AppealStatus.PROCESSING);
			appealService.save(appeal);
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/handle")
	public Result handle(Long appealId) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setHandleTime(new Date());
			appeal.setStatus(AppealStatus.UNCONFIRM);
			appealService.save(appeal);
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/confirm", method = RequestMethod.POST)
	public Result confirm(Long appealId, Integer accept, Integer handle, Integer result, String content) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setStatus(AppealStatus.CONFIRMED);
			
			Date now = new Date();
			EvaluationEntity evaluation = new EvaluationEntity(accept, handle, result, content, now, now);
			appeal.setEvaluation(evaluation);
			appealService.save(appeal);
			
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/reject", method = RequestMethod.POST)
	public Result reject(Long appealId, String rejectOpinion) {
		try {
			AppealEntity appeal = appealService.findOne(appealId);
			appeal.setStatus(AppealStatus.REJECT);
			appeal.setRejectOpinion(rejectOpinion);
			appealService.save(appeal);
			
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/urge", method = RequestMethod.POST)
	public Result urge(Long appealId, Long userId, String content) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			Date now = new Date();
			UrgeEntity urge = new UrgeEntity(appealId, user, content, now, now);
			urgeService.save(urge);
			return new Result(Code.SUCCESS.value(), "ok");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/getAppealCountByType", method = RequestMethod.POST)
	public Result getAppealCountByType(@RequestParam(required = false) Long departmentId) {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		List<Object[]> list = appealService.getAppealCountByType(departmentId);
		
		for (int y = 0; y < list.size(); y++) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("appealTypeId", list.get(y)[0]);
			resultMap.put("appealTypeName", list.get(y)[1]);
			resultMap.put("count", list.get(y)[2]);
			resultList.add(resultMap);
		}
		try {
			return new ResultInfo(Code.SUCCESS.value(), "ok", resultList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/appealStatusCount", method = RequestMethod.POST)
	public Result getStatusCount(@RequestParam(required = false) Long departmentId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<AppealTypeEntity> aptList = appealTypeService.list();
		
		try {
			for (int x = 0; x < aptList.size(); x++) {
				Map<String, List<AppealEntity>> map = new HashMap<String, List<AppealEntity>>();
				for (int i = 0; i < 7; i++) {
					List<AppealEntity> list = appealService.findByAppealTypeIdAndStatus(aptList.get(x).getId(), i,
							departmentId);
					map.put(String.valueOf(i), list);
				}
				resultMap.put(aptList.get(x).getName(), map);
			}
			
			return new ResultInfo(Code.SUCCESS.value(), "ok", resultMap);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/overAppealDays", method = RequestMethod.POST)
	public Result getAppealDays(@RequestParam(required = false) Long enterpriseId,
			@RequestParam(required = false) Long departmentId) {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		List<AppealTypeEntity> aptList = appealTypeService.list();
		if (aptList.size() == 0) {
			return new ResultInfo(Code.SUCCESS.value(), "ok", null);
		}
		try {
			for (int i = 0; i < aptList.size(); i++) {
				List<AppealEntity> acceptDays = new ArrayList<AppealEntity>();
				List<AppealEntity> handleDays = new ArrayList<AppealEntity>();
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("appealTypeName", aptList.get(i).getName());
				List<BigInteger> acceptDaysData = appealService.getOverAcceptDays(departmentId, enterpriseId,
						aptList.get(i).getId());
				for (int x = 0; x < acceptDaysData.size(); x++) {
					acceptDays.add(appealService.findOne(((BigInteger) acceptDaysData.get(x)).longValue()));
				}
				List<BigInteger> handleDaysData = appealService.getOverHandleDays(departmentId, enterpriseId,
						aptList.get(i).getId());
				for (int x = 0; x < handleDaysData.size(); x++) {
					handleDays.add(appealService.findOne(((BigInteger) handleDaysData.get(x)).longValue()));
				}
				resultMap.put("acceptDays", acceptDays);
				resultMap.put("handleDays", handleDays);
				resultList.add(resultMap);
			}
			return new ResultInfo(Code.SUCCESS.value(), "ok", resultList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/appeal/search")
	public Result search(String input) {
		try {
			List<AppealEntity> list = appealService.search(input);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
}

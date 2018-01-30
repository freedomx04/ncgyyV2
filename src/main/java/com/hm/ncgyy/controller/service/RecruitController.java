package com.hm.ncgyy.controller.service;

import java.util.Date;
import java.util.List;

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
import com.hm.ncgyy.entity.authority.UserBaseEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;
import com.hm.ncgyy.entity.service.talent.JobEntity;
import com.hm.ncgyy.entity.service.talent.RecruitEntity;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.service.SupplierService;
import com.hm.ncgyy.service.service.talent.JobService;
import com.hm.ncgyy.service.service.talent.RecruitService;

@RestController
public class RecruitController {

	static Logger log = LoggerFactory.getLogger(RecruitController.class);

	@Autowired
	RecruitService recruitService;

	@Autowired
	SupplierService supplierService;

	@Autowired
	JobService jobService;

	@Autowired
	UserService userService;

	/**
	 * 招聘
	 */
	@RequestMapping(value = "/api/service/talent/recruit/create", method = RequestMethod.POST)
	public Result recruit_create(Long supplierId, String position, String profession, String salary,
			String workingYears, String education, String responsibility, String requirement, String address,
			String contactUser, String contact) {
		try {
			SupplierEntity supplier = supplierService.findOne(supplierId);
			Date now = new Date();
			RecruitEntity recruit = new RecruitEntity(supplier, position, profession, salary, workingYears, education,
					responsibility, requirement, address, contactUser, contact, now, now);
			recruitService.save(recruit);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/recruit/update", method = RequestMethod.POST)
	public Result recruit_update(Long recruitId, String position, String profession, String salary, String workingYears,
			String education, String responsibility, String requirement, String address, String contactUser,
			String contact) {
		try {
			RecruitEntity recruit = recruitService.findOne(recruitId);
			recruit.setPosition(position);
			recruit.setProfession(profession);
			recruit.setSalary(salary);
			recruit.setWorkingYears(workingYears);
			recruit.setEducation(education);
			recruit.setResponsibility(responsibility);
			recruit.setRequirement(requirement);
			recruit.setAddress(address);
			recruit.setContactUser(contactUser);
			recruit.setContact(contact);
			recruit.setUpdateTime(new Date());
			recruitService.save(recruit);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/recruit/delete")
	public Result recruit_delete(Long recruitId) {
		try {
			recruitService.delete(recruitId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/recruit/deleteBatch")
	public Result recruit_deleteBatch(@RequestParam("recruitIdList[]") List<Long> recruitIdList) {
		try {
			recruitService.delete(recruitIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/recruit/get")
	public Result recruit_get(Long recruitId) {
		try {
			RecruitEntity recruit = recruitService.findOne(recruitId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", recruit);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/recruit/listPaging", method = RequestMethod.POST)
	public Result recruit_listPaging(int page, int size) {
		try {
			Page<RecruitEntity> list = recruitService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/recruit/listBySupplierId")
	public Result recruit_listBySupplierId(Long supplierId) {
		try {
			List<RecruitEntity> list = recruitService.listBySupplierId(supplierId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/recruit/search", method = RequestMethod.POST)
	public Result recruit_search(String searchStr, int page, int size) {
		try {
			Page<RecruitEntity> list = recruitService.search(searchStr, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/recruit/filter", method = RequestMethod.POST)
	public Result recruit_filter(String profession, String education, String workingYears, String salary, int page,
			int size) {
		try {
			Page<RecruitEntity> list = recruitService.filter(profession, education, workingYears, salary, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	/**
	 * 求职
	 */
	@RequestMapping(value = "/api/service/talent/job/create", method = RequestMethod.POST)
	public Result job_create(Long userId, String intention, String name, String sex, Integer age, String avatar,
			String profession, String education, String workingYears, String salary, String area, String introduction,
			String experience, String contact) {
		try {
			UserBaseEntity user = userService.findOneBase(userId);
			Date now = new Date();
			JobEntity job = new JobEntity(user, intention, name, sex, age, avatar, profession, education, workingYears,
					salary, area, introduction, experience, contact, now, now);
			jobService.save(job);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/job/update", method = RequestMethod.POST)
	public Result job_update(Long jobId, String intention, String name, String sex, Integer age, String avatar,
			String profession, String education, String workingYears, String salary, String area, String introduction,
			String experience, String contact) {
		try {
			JobEntity job = jobService.findOne(jobId);
			job.setIntention(intention);
			job.setName(name);
			job.setSex(sex);
			job.setAge(age);
			job.setAvatar(avatar);
			job.setProfession(profession);
			job.setEducation(education);
			job.setWorkingYears(workingYears);
			job.setSalary(salary);
			job.setArea(area);
			job.setIntroduction(introduction);
			job.setExperience(experience);
			job.setContact(contact);
			job.setUpdateTime(new Date());
			jobService.save(job);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/job/delete")
	public Result job_delete(Long jobId) {
		try {
			jobService.delete(jobId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/job/deleteBatch")
	public Result job_deleteBatch(@RequestParam("jobIdList[]") List<Long> jobIdList) {
		try {
			jobService.delete(jobIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/job/get")
	public Result job_get(Long jobId) {
		try {
			JobEntity job = jobService.findOne(jobId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", job);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/job/listPaging")
	public Result job_listPaging(int page, int size) {
		try {
			Page<JobEntity> list = jobService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/job/listByUserId")
	public Result job_listByUserId(Long userId) {
		try {
			List<JobEntity> list = jobService.listByUserId(userId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/job/search", method = RequestMethod.POST)
	public Result job_search(String searchStr, int page, int size) {
		try {
			Page<JobEntity> list = jobService.search(searchStr, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/service/talent/job/filter", method = RequestMethod.POST)
	public Result job_filter(String profession, String education, String workingYears, String salary, int page,
			int size) {
		try {
			Page<JobEntity> list = jobService.filter(profession, education, workingYears, salary, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

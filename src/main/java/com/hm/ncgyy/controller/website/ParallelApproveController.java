package com.hm.ncgyy.controller.website;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.website.ParallelApproveEntity;
import com.hm.ncgyy.service.website.ParallelApproveService;

@RestController
public class ParallelApproveController {
	
	static Logger log = LoggerFactory.getLogger(ParallelApproveController.class);
	
	@Autowired
	ParallelApproveService approveService;
	
	@RequestMapping(value = "/api/website/parallelApprove/create", method = RequestMethod.POST)
	public Result create(String title, String link) {
		try {
			Date now = new Date();
			ParallelApproveEntity approve = new ParallelApproveEntity(title, link, now, now);
			approveService.save(approve);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/parallelApprove/update", method = RequestMethod.POST)
	public Result update(Long approveId, String title, String link) {
		try {
			ParallelApproveEntity approve = approveService.findOne(approveId);
			approve.setTitle(title);
			approve.setLink(link);
			approve.setUpdateTime(new Date());
			approveService.save(approve);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/parallelApprove/delete")
	public Result delete(Long approveId) {
		try {
			approveService.delete(approveId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/parallelApprove/deleteBatch")
	public Result deleteBatch(@RequestParam("approveIdList[]") List<Long> approveIdList) {
		try {
			approveService.delete(approveIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/parallelApprove/get")
	public Result get(Long approveId) {
		try {
			ParallelApproveEntity approve = approveService.findOne(approveId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", approve);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/parallelApprove/list")
	public Result list() {
		try {
			List<ParallelApproveEntity> list = approveService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

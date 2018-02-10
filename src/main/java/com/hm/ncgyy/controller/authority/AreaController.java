package com.hm.ncgyy.controller.authority;

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
import com.hm.ncgyy.entity.authority.AreaEntity;
import com.hm.ncgyy.service.authority.AreaService;

@RestController
public class AreaController {

	static Logger log = LoggerFactory.getLogger(AreaController.class);

	@Autowired
	AreaService areaService;

	@RequestMapping(value = "/api/area/create", method = RequestMethod.POST)
	public Result create(String name) {
		try {
			AreaEntity area = areaService.findByName(name);
			if (area != null) {
				return new Result(Code.EXISTED.value(), "园区已存在");
			}
			Date now = new Date();
			area = new AreaEntity(name, now, now);
			area = areaService.save(area);
			return new ResultInfo(Code.SUCCESS.value(), "添加成功", area);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/area/update", method = RequestMethod.POST)
	public Result update(Long areaId, String name) {
		try {
			AreaEntity area = areaService.findOne(areaId);
			AreaEntity updateArea = areaService.findByName(name);
			if (updateArea == null || area.getId() == updateArea.getId()) {
				area.setName(name);
				area.setUpdateTime(new Date());
				areaService.save(area);
			} else {
				return new Result(Code.EXISTED.value(), "园区已存在");
			}
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/area/delete")
	public Result delete(Long areaId) {
		try {
			areaService.delete(areaId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/area/batchDelete")
	public Result batchDelete(@RequestParam("areaIdList[]") List<Long> areaIdList) {
		try {
			areaService.delete(areaIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "该数据存在关联, 无法删除");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/area/get")
	public Result get(Long areaId) {
		try {
			AreaEntity area = areaService.findOne(areaId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", area);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/area/list")
	public Result list() {
		try {
			List<AreaEntity> areaList = areaService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", areaList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

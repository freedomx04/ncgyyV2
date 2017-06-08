package com.hm.ncgyy.controller.base;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.service.base.AreaService;

@RestController
public class AreaController {
	
	static Logger log = LoggerFactory.getLogger(AreaController.class);
	
	@Autowired
	AreaService areaService;
	
	/**
	 * 创建区域
	 * @param name
	 * @param description
	 * @return
	 */
	@RequestMapping(value = "/api/area/create", method = RequestMethod.POST)
	public Result create(String name, String description) {
		try {
			AreaEntity area = areaService.findByName(name);
			if (area != null) {
				return new Result(Code.EXISTED.value(), "existed");
			}
			
			Date now = new Date();
			area = new AreaEntity(name, description, now, now);
			areaService.save(area);
			return new Result(Code.SUCCESS.value(), "created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * 更新区域
	 * @param areaId
	 * @param name
	 * @param description
	 * @return
	 */
	@RequestMapping(value = "/api/area/update", method = RequestMethod.POST)
	public Result update(Long areaId, String description) {
		try {
			AreaEntity area = areaService.findOne(areaId);
			area.setDescription(description);
			area.setUpdateTime(new Date());
			areaService.save(area);
			return new Result(Code.SUCCESS.value(), "updated");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * 删除区域
	 * @param areaId
	 * @return
	 */
	@RequestMapping(value = "/api/area/delete")
	public Result delete(Long areaId) {
		try {
			areaService.delete(areaId);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * 批量删除区域
	 * @param areaIdList
	 * @return
	 */
	@RequestMapping(value = "/api/area/batchDelete")
	public Result batchDelete(@RequestParam("areaIdList[]") List<Long> areaIdList) {
		try {
			areaService.delete(areaIdList);
			return new Result(Code.SUCCESS.value(), "deleted");
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint"); 
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * 获取区域详情
	 * @param areaId
	 * @return
	 */
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
	
	/**
	 * 获取区域列表
	 * @return
	 */
	@RequestMapping(value= "/api/area/list")
	public Result list() {
		try {
			List<AreaEntity> areaList = areaService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", areaList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	/**
	 * 区域是否存在
	 * @param name
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value = "/api/area/exist")
	public @ResponseBody String exist(String name) throws JsonProcessingException {
		boolean result = true;

		AreaEntity area = areaService.findByName(name);
		if (area != null) {
			result = false;
		}

		Map<String, Boolean> map = new HashMap<>();
		map.put("valid", result);
		ObjectMapper mapper = new ObjectMapper();
		String resultString = mapper.writeValueAsString(map);

		return resultString;
	}

}

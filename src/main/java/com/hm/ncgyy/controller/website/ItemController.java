package com.hm.ncgyy.controller.website;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
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
import com.hm.ncgyy.entity.website.ItemEntity;
import com.hm.ncgyy.entity.website.ItemEntity.ItemStatus;
import com.hm.ncgyy.entity.website.ItemFileEntity;
import com.hm.ncgyy.service.CommonService;
import com.hm.ncgyy.service.website.ItemFileService;
import com.hm.ncgyy.service.website.ItemService;

@RestController
public class ItemController {

	static Logger log = LoggerFactory.getLogger(ItemController.class);

	@Autowired
	ItemService itemService;

	@Autowired
	ItemFileService itemFileService;
	
	@Autowired
	CommonService commonService;

	@RequestMapping(value = "/api/website/item/create", method = RequestMethod.POST)
	public Result create(String name, String level, String unit, String deadline, String content,
			@RequestParam("fileList") List<String> fileList) {
		try {
			Date now = new Date();
			ItemEntity item = new ItemEntity(name, level, unit, deadline, content, now, now);
			itemService.save(item);

			for (String file : fileList) {
				String filename = StringUtils.split(file, "?")[0];
				String filepath = StringUtils.split(file, "?")[1];
				ItemFileEntity itemFile = new ItemFileEntity(item.getId(), filename, filepath, now, now);
				itemFileService.save(itemFile);
			}

			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/item/update", method = RequestMethod.POST)
	public Result update(Long itemId, String name, String level, String unit, String deadline, String content,
			@RequestParam("fileList") List<String> fileList) {
		try {
			Date now = new Date();
			
			ItemEntity item = itemService.findOne(itemId);
			item.setName(name);
			item.setLevel(level);
			item.setUnit(unit);
			item.setDeadline(deadline);
			item.setContent(content);
			item.setUpdateTime(now);
			itemService.save(item);
			
			for (String file : fileList) {
				String filename = StringUtils.split(file, "?")[0];
				String filepath = StringUtils.split(file, "?")[1];
				ItemFileEntity itemFile = new ItemFileEntity(item.getId(), filename, filepath, now, now);
				itemFileService.save(itemFile);
			}

			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/item/delete")
	public Result delete(Long itemId) {
		try {
			List<ItemFileEntity> itemFiles = itemFileService.listByItemId(itemId);
			for (ItemFileEntity itemFile: itemFiles) {
				itemFileService.delete(itemFile.getId());
				commonService.deleteFile(itemFile.getFilepath());
			}
			itemService.delete(itemId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/item/deleteBatch")
	public Result batchDelete(@RequestParam("itemIdList[]") List<Long> itemIdList) {
		try {
			for (Long itemId : itemIdList) {
				delete(itemId);
			}
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/item/get")
	public Result get(Long itemId) {
		try {
			ItemEntity item = itemService.findOne(itemId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", item);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/item/declare")
	public Result declare(Long itemId) {
		try {
			ItemEntity item = itemService.findOne(itemId);
			item.setStatus(ItemStatus.STATUS_DECLARE);
			item.setUpdateTime(new Date());
			itemService.save(item);
			return new Result(Code.SUCCESS.value(), "操作成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/item/public", method = RequestMethod.POST)
	public Result item_public(Long itemId, String result) {
		try {
			ItemEntity item = itemService.findOne(itemId);
			item.setResult(result);
			item.setStatus(ItemStatus.STATUS_PUBLIC);
			itemService.save(item);
			return new Result(Code.SUCCESS.value(), "操作成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/item/list")
	public Result list() {
		try {
			List<ItemEntity> list = itemService.list();
			
			for (ItemEntity item: list) {
				if (item.getStatus() < 2) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String nowStr = sdf.format(new Date());
					Date now = sdf.parse(nowStr);
					Date deadline = sdf.parse(item.getDeadline());
					
					if (now.after(deadline)) {
						item.setStatus(ItemStatus.STATUS_END);
						itemService.save(item);
					}
				}
			}
			
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/item/listPaging")
	public Result listPaging(int page, int size) {
		try {
			Page<ItemEntity> list = itemService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/item/listByStatus")
	public Result listByStatus(Integer status) {
		try {
			List<ItemEntity> list = itemService.listByStatus(status);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/item/listPagingByStatus")
	public Result listPagingByStatus(Integer status, int page, int size) {
		try {
			Page<ItemEntity> list = itemService.listByStatus(status, page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/api/website/item/fileDelete")
	public Result fileDelete(Long itemFileId) {
		try {
			ItemFileEntity itemFile = itemFileService.findOne(itemFileId);
			commonService.deleteFile(itemFile.getFilepath());
			itemFileService.delete(itemFileId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Result(Code.CONSTRAINT.value(), "constraint");
			}
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

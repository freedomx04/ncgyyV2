package com.hm.ncgyy.controller.website;

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
import com.hm.ncgyy.entity.website.BusinessItemEntity;
import com.hm.ncgyy.entity.website.MessageEntity;
import com.hm.ncgyy.service.website.BusinessItemService;
import com.hm.ncgyy.service.website.MessageService;

@RestController
public class BusinessController {

	static Logger log = LoggerFactory.getLogger(BusinessController.class);

	@Autowired
	BusinessItemService itemService;

	@Autowired
	MessageService messageService;

	/**
	 * item
	 */
	@RequestMapping(value = "/api/website/business/item/create", method = RequestMethod.POST)
	public Result item_create(String name, String address, String overview, String content, String scale, String mode,
			String contactUser, String contact, String email, String fax) {
		try {
			Date now = new Date();
			BusinessItemEntity item = new BusinessItemEntity(name, address, overview, content, scale, mode, contactUser,
					contact, email, fax, now, now);
			itemService.save(item);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/item/update", method = RequestMethod.POST)
	public Result item_update(Long itemId, String name, String address, String overview, String content, String scale,
			String mode, String contactUser, String contact, String email, String fax) {
		try {
			BusinessItemEntity item = itemService.findOne(itemId);
			item.setName(name);
			item.setAddress(address);
			item.setOverview(overview);
			item.setContent(content);
			item.setScale(scale);
			item.setMode(mode);
			item.setContactUser(contactUser);
			item.setContact(contact);
			item.setEmail(email);
			item.setFax(fax);
			item.setUpdateTime(new Date());
			itemService.save(item);
			return new Result(Code.SUCCESS.value(), "编辑成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/item/delete")
	public Result item_delete(Long itemId) {
		try {
			itemService.delete(itemId);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/item/deleteBatch")
	public Result item_deleteBatch(@RequestParam("itemIdList[]") List<Long> itemIdList) {
		try {
			itemService.delete(itemIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/item/get")
	public Result item_get(Long itemId) {
		try {
			BusinessItemEntity item = itemService.findOne(itemId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", item);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/item/list")
	public Result item_list() {
		try {
			List<BusinessItemEntity> list = itemService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/item/listPaging")
	public Result item_listPaging(int page, int size) {
		try {
			Page<BusinessItemEntity> list = itemService.list(page, size);
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	/**
	 * message
	 */
	@RequestMapping(value = "/api/website/business/message/create", method = RequestMethod.POST)
	public Result message_create(String name, String contact, String area, String email, String qq, String content) {
		try {
			Date now = new Date();
			MessageEntity message = new MessageEntity(name, contact, area, email, qq, content, now, now);
			messageService.save(message);
			return new Result(Code.SUCCESS.value(), "添加成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/message/deleteBatch")
	public Result message_deleteBatch(@RequestParam("messageIdList[]") List<Long> messageIdList) {
		try {
			messageService.delete(messageIdList);
			return new Result(Code.SUCCESS.value(), "删除成功");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/message/get")
	public Result message_get(Long messageId) {
		try {
			MessageEntity message = messageService.findOne(messageId);
			return new ResultInfo(Code.SUCCESS.value(), "ok", message);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

	@RequestMapping(value = "/api/website/business/message/list")
	public Result message_list() {
		try {
			List<MessageEntity> list = messageService.list();
			return new ResultInfo(Code.SUCCESS.value(), "ok", list);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

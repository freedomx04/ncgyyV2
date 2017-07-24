package com.hm.ncgyy.controller.wx;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hm.ncgyy.common.result.Code;
import com.hm.ncgyy.common.result.Result;
import com.hm.ncgyy.common.result.ResultInfo;
import com.hm.ncgyy.common.wx.WxUtil;

@RestController
public class WxMessageController {
	
	static Logger log = LoggerFactory.getLogger(WxMessageController.class);
	
	@RequestMapping(value = "/wx/message/send", method = RequestMethod.POST)
	public Result send(String toUser, String agentid, String content) {
		try {
			String ret = WxUtil.getInstace().send(toUser, agentid, content);
			return new ResultInfo(Code.SUCCESS.value(), "ok", ret);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Result(Code.ERROR.value(), e.getMessage());
		}
	}

}

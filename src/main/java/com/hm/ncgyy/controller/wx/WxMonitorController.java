package com.hm.ncgyy.controller.wx;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hm.ncgyy.common.wx.WxUtil;
import com.hm.ncgyy.entity.authority.EnterpriseBaseEntity;
import com.hm.ncgyy.entity.authority.EnterpriseEntity;
import com.hm.ncgyy.entity.authority.UserEntity;
import com.hm.ncgyy.entity.base.AreaEntity;
import com.hm.ncgyy.entity.base.IndustryEntity;
import com.hm.ncgyy.service.authority.EnterpriseService;
import com.hm.ncgyy.service.authority.UserService;
import com.hm.ncgyy.service.base.AreaService;
import com.hm.ncgyy.service.base.IndustryService;

@Controller
public class WxMonitorController {
	
	static Logger log = LoggerFactory.getLogger(WxMonitorController.class);
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	IndustryService industryService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/wx/monitor")
	String monitor(ModelMap modelMap) {
		//return WxUtil.getInstace().redirect(modelMap, request, userService, "wx/monitor/menu");
		return "wx/monitor/menu";
	}
	
	@RequestMapping(value = "/wx/monitorGV")
	String monitorGV(ModelMap modelMap) {
		String type = request.getParameter("type");
		String item = type != "" ? type.split("-")[0] : "0";
		
		switch (item) {
		case "0":
			List<EnterpriseBaseEntity> enterpriseList = enterpriseService.listBase();
			modelMap.addAttribute("selectList", enterpriseList);
			break;
		case "1":
			List<IndustryEntity> industryList = industryService.list();
			modelMap.addAttribute("selectList", industryList);
			break;
		case "2":
			List<AreaEntity> areaList = areaService.list();
			modelMap.addAttribute("selectList", areaList);
			break;
		case "3":
			List<EnterpriseBaseEntity> pointEnterpriseList = enterpriseService.listPoint();
			modelMap.addAttribute("selectList", pointEnterpriseList);
			break;
		}
		
		return "wx/monitor/monitor_gv";
	}
	
	@RequestMapping(value = "/wx/monitorEP")
	String monitorEP(ModelMap modelMap, String type, Long userId) {
		String item = type != "" ? type.split("-")[0] : "0";
		
		switch (item) {
		case "0":
			UserEntity user = userService.findOne(userId);
			EnterpriseEntity enterprise = user.getEnterprise();
			modelMap.addAttribute("enterprise", enterprise);
			break;
		case "1":
			List<IndustryEntity> industryList = industryService.list();
			modelMap.addAttribute("selectList", industryList);
			break;
		case "2":
			List<AreaEntity> areaList = areaService.list();
			modelMap.addAttribute("selectList", areaList);
			break;
		case "3":
			List<EnterpriseBaseEntity> pointEnterpriseList = enterpriseService.listPoint();
			modelMap.addAttribute("selectList", pointEnterpriseList);
			break;
		}
		
		return "wx/monitor/monitor_ep";
	}
	
}

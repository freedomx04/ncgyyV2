package com.hm.ncgyy.common.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

public class IpUtils {

	static Logger log = LoggerFactory.getLogger(IpUtils.class);

	public static IpUtils INSTANCE = null;

	public IpUtils() {
		// TODO Auto-generated constructor stub
	}

	public static IpUtils getInstance() {
		if (INSTANCE == null) {
			synchronized (IpUtils.class) {
				if (INSTANCE == null) {
					INSTANCE = new IpUtils();
				}
			}
		}
		return INSTANCE;
	}

	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	public static LocationEntity getIpInfo(String ip) {
		LocationEntity ret = null;
		try {
			if (ip.equals("0:0:0:0:0:0:0:1")) {
				return null;
			}

			String url = "http://ip.taobao.com/service/getIpInfo2.php?ip=" + ip;
			String content = HttpUtils.getResponseAsString(url);

			Gson gson = new Gson();
			TaobaoEntity retEntity = gson.fromJson(content, TaobaoEntity.class);

			if (retEntity.getCode() == 0) {
				ret = retEntity.getData();
			}
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}
		return ret;
	}

	public class TaobaoEntity {

		private Integer code;
		private LocationEntity data;

		public Integer getCode() {
			return code;
		}

		public void setCode(Integer code) {
			this.code = code;
		}

		public LocationEntity getData() {
			return data;
		}

		public void setData(LocationEntity data) {
			this.data = data;
		}
	}

	public class LocationEntity {

		private String area; // 区域
		private String isp; // 服务商
		private String country; // 国家
		private String region; // 省份
		private String city; // 市
		private String county; // 县

		public LocationEntity() {
			// TODO Auto-generated constructor stub
		}

		public String getArea() {
			return area;
		}

		public void setArea(String area) {
			this.area = area;
		}

		public String getIsp() {
			return isp;
		}

		public void setIsp(String isp) {
			this.isp = isp;
		}

		public String getCountry() {
			return country;
		}

		public void setCountry(String country) {
			this.country = country;
		}

		public String getRegion() {
			return region;
		}

		public void setRegion(String region) {
			this.region = region;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getCounty() {
			return county;
		}

		public void setCounty(String county) {
			this.county = county;
		}

	}

}

package com.hm.ncgyy.entity.authority;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_login")
public class LoginEntity extends BaseEntity {
	
	/**
	 * 关联用户id
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user;
	
	/**
	 * 登录ip
	 */
	private String ip;
	
	/**
	 * 登录地点
	 */
	private String location;
	
	/**
	 * 运营商
	 */
	private String isp;
	
	public LoginEntity() {
		// TODO Auto-generated constructor stub
	}

	public LoginEntity(UserBaseEntity user, String ip, String location, String isp, Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.ip = ip;
		this.location = location;
		this.isp = isp;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getIsp() {
		return isp;
	}

	public void setIsp(String isp) {
		this.isp = isp;
	}
	
}

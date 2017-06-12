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
	
	public class LoginMode {
		public static final int MODE_USERNAME = 0;
		public static final int MODE_MOBILE = 1;
		public static final int MODE_EMAIL = 2;
	}
	
	/**
	 * 关联用户id
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserEntity user;
	
	/**
	 * 登录ip
	 */
	private String ip;
	
	/**
	 * 登录地点
	 */
	private String location;
	
	/**
	 * 登录方式
	 */
	private Integer mode = LoginMode.MODE_USERNAME;
	
	public LoginEntity() {
		// TODO Auto-generated constructor stub
	}

	public LoginEntity(UserEntity user, String ip, String location, Integer mode, Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.ip = ip;
		this.location = location;
		this.mode = mode;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
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

	public Integer getMode() {
		return mode;
	}

	public void setMode(Integer mode) {
		this.mode = mode;
	}
	
}

package com.hm.ncgyy.entity.authority;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_user")
public class UserEntity extends BaseEntity {

	/**
	 * 用户状态 0: 有效 1：无效
	 */
	public class UserStatus {
		public static final int STATUS_VALID = 0;
		public static final int STATUS_NO_VALID = 1;
	}

	/**
	 * 性别 0：未定义 1：男 2：女
	 */
	public class Gender {
		public static final int GENDER_UNDERFINE = 0;
		public static final int GENDER_MALE = 1;
		public static final int GENDER_FEMALE = 2;
	}

	/**
	 * 用户名,唯一
	 */
	@Column(unique = true)
	private String username;
	
	/**
	 * MD5加密后的密码
	 */
	private String password;
	
	/**
	 * 姓名
	 */
	private String name;
	
	/**
	 * 手机号码,唯一
	 */
	@Column(unique = true)
	private String mobile;
	
	/**
	 * 邮箱,唯一
	 */
	@Column(unique = true)
	private String email;
	
	/**
	 * 性别,默认为未定义
	 */
	private Integer gender = Gender.GENDER_UNDERFINE;
	
	/**
	 * 头像地址
	 */
	private String avatar;
	
	/**
	 * 关联角色
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "role_id")
	private RoleEntity role;
	
	/**
	 * 用户状态
	 */
	private Integer status = UserStatus.STATUS_VALID;
	
	
	//private EnterpriseEntity enterprise;
	
	//private DepartmentEntity department;
	
	/**
	 * 微信userId
	 */
	private String wxUserId;
	
	public UserEntity() {
		// TODO Auto-generated constructor stub
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public RoleEntity getRole() {
		return role;
	}

	public void setRole(RoleEntity role) {
		this.role = role;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getWxUserId() {
		return wxUserId;
	}

	public void setWxUserId(String wxUserId) {
		this.wxUserId = wxUserId;
	}
	
}

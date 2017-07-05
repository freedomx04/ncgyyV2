package com.hm.ncgyy.entity.authority;

import java.util.Date;

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
	 * 头像
	 */
	private String avatar = "default_user";

	/**
	 * 手机号码,唯一
	 */
	@Column(unique = true)
	private String mobile;

	/**
	 * 邮箱
	 */
	private String email;

	/**
	 * 性别,默认为未定义
	 */
	private Integer gender = Gender.GENDER_UNDERFINE;

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

	/**
	 * 关联企业
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseEntity enterprise;

	/**
	 * 关联部门
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "department_id")
	private DepartmentEntity department;

	/**
	 * 微信userId
	 */
	private String wxUserId;

	/**
	 * 个人描述
	 */
	@Column(length = 4000)
	private String introduction;

	public UserEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public UserEntity(String username, String password, RoleEntity role, String mobile, Date createTime, Date updateTime) {
		this.username = username;
		this.password = password;
		this.role = role;
		this.mobile = mobile;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public UserEntity(String username, String name, String avatar, String mobile, String email, Integer gender,
			RoleEntity role, String introduction, Date createTime, Date updateTime) {
		super();
		this.username = username;
		this.name = name;
		this.avatar = avatar;
		this.mobile = mobile;
		this.email = email;
		this.gender = gender;
		this.role = role;
		this.introduction = introduction;
		this.createTime = createTime;
		this.updateTime = updateTime;
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

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
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

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public EnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public DepartmentEntity getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentEntity department) {
		this.department = department;
	}

}

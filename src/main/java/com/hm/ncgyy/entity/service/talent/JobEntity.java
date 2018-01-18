package com.hm.ncgyy.entity.service.talent;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "service_talent_job")
public class JobEntity extends BaseEntity {

	/** 性别 */
	public class Sex {
		public static final int MALE = 0; // 男
		public static final int FEMALE = 1; // 女
	}

	/** 求职用户 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user;

	/** 姓名 */
	private String name;

	/** 性别 */
	private Integer sex;

	/** 头像 */
	private String avatarPath;

	/** 行业 */
	private Integer profession;

	/** 期望薪资 */
	private Integer salary;

	/** 工作年限 */
	private Integer workingYears;

	/** 学历 */
	private Integer education;

	/** 联系电话 */
	private String contact;

	/** 求职意向 */
	private String intention;

	/** 自我介绍 */
	private String introduction;

	/** 工作经历 */
	private String experience;

	public JobEntity() {
		// TODO Auto-generated constructor stub
	}

	public JobEntity(UserBaseEntity user, String name, Integer sex, String avatarPath, Integer profession,
			Integer salary, Integer workingYears, Integer education, String contact, String intention,
			String introduction, String experience, Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.name = name;
		this.sex = sex;
		this.avatarPath = avatarPath;
		this.profession = profession;
		this.salary = salary;
		this.workingYears = workingYears;
		this.education = education;
		this.contact = contact;
		this.intention = intention;
		this.introduction = introduction;
		this.experience = experience;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getAvatarPath() {
		return avatarPath;
	}

	public void setAvatarPath(String avatarPath) {
		this.avatarPath = avatarPath;
	}

	public Integer getProfession() {
		return profession;
	}

	public void setProfession(Integer profession) {
		this.profession = profession;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public Integer getWorkingYears() {
		return workingYears;
	}

	public void setWorkingYears(Integer workingYears) {
		this.workingYears = workingYears;
	}

	public Integer getEducation() {
		return education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getIntention() {
		return intention;
	}

	public void setIntention(String intention) {
		this.intention = intention;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

}

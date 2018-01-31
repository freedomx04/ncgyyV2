package com.hm.ncgyy.entity.service.talent;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "service_talent_job", indexes = {
	@Index(name = "index_service_talent_job_updateTime", columnList = "updateTime"),
	@Index(name = "index_service_talent_job_user", columnList = "user_id, updateTime"),
	@Index(name = "index_service_talent_job_search", columnList = "intention, updateTime"),
	@Index(name = "index_service_talent_job_filter", columnList = "profession, salary, workingYears, education, updateTime")
})
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

	/** 求职意向 */
	private String intention;

	/** 姓名 */
	private String name;

	/** 性别 */
	private String sex;

	/** 年龄 */
	private Integer age;

	/** 头像 */
	private String avatar;

	/** 专业 */
	private String profession;

	/** 学历 */
	private String education;

	/** 工作年限 */
	private String workingYears;

	/** 期望薪资 */
	private String salary;

	/** 期望地区 */
	private String area;

	/** 自我介绍 */
	@Column(length = 4000)
	private String introduction;

	/** 工作经历 */
	@Column(length = 4000)
	private String experience;
	
	/** 联系电话 */
	private String contact;

	public JobEntity() {
		// TODO Auto-generated constructor stub
	}

	public JobEntity(UserBaseEntity user, String intention, String name, String sex, Integer age, String avatar,
			String profession, String education, String workingYears, String salary, String area, String introduction,
			String experience, String contact, Date createTime, Date updateTime) {
		super();
		this.user = user;
		this.intention = intention;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.avatar = avatar;
		this.profession = profession;
		this.education = education;
		this.workingYears = workingYears;
		this.salary = salary;
		this.area = area;
		this.introduction = introduction;
		this.experience = experience;
		this.contact = contact;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
	}

	public String getIntention() {
		return intention;
	}

	public void setIntention(String intention) {
		this.intention = intention;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getWorkingYears() {
		return workingYears;
	}

	public void setWorkingYears(String workingYears) {
		this.workingYears = workingYears;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
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

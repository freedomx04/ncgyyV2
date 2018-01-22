package com.hm.ncgyy.entity.service.talent;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.service.SupplierEntity;

@Entity
@Table(name = "service_talent_recruit")
public class RecruitEntity extends BaseEntity {
	
	/** 供应商 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "supplier_id")
	private SupplierEntity supplier;
	
	/** 招聘职位 */
	private String position;
	
	/** 行业 */
	private String profession;
	
	/** 薪资待遇 */
	private String salary;
	
	/** 工作年限 */
	private String workingYears;
	
	/** 学历 */
	private String education;
	
	/** 岗位职责 */
	private String responsibility;
	
	/** 任职要求 */
	private String requirement;
	
	/** 工作地点 */
	private String address;
	
	/** 联系人 */
	private String contactUser;
	
	/** 联系电话 */
	private String contact;
	
	public RecruitEntity() {
		// TODO Auto-generated constructor stub
	}

	public RecruitEntity(SupplierEntity supplier, String position, String profession, String salary,
			String workingYears, String education, String responsibility, String requirement,
			String address, String contactUser, String contact, Date createTime, Date updateTime) {
		super();
		this.supplier = supplier;
		this.position = position;
		this.profession = profession;
		this.salary = salary;
		this.workingYears = workingYears;
		this.education = education;
		this.responsibility = responsibility;
		this.requirement = requirement;
		this.address = address;
		this.contactUser = contactUser;
		this.contact = contact;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public SupplierEntity getSupplier() {
		return supplier;
	}

	public void setSupplier(SupplierEntity supplier) {
		this.supplier = supplier;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getWorkingYears() {
		return workingYears;
	}

	public void setWorkingYears(String workingYears) {
		this.workingYears = workingYears;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getResponsibility() {
		return responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactUser() {
		return contactUser;
	}

	public void setContactUser(String contactUser) {
		this.contactUser = contactUser;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

}

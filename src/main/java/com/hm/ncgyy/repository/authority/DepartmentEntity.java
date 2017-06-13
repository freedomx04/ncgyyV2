package com.hm.ncgyy.repository.authority;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "authority_department")
public class DepartmentEntity extends BaseEntity {
	
	/**
	 * 部门名称
	 */
	@Column(unique = true)
	private String name;
	
	/**
	 * 部门信息
	 */
	private String description;
	
	/**
	 * 部门负责人
	 */
	private String principal;
	
	/**
	 * 部门联系人
	 */
	@OneToMany(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "department_id")
    private List<UserBaseEntity> users = new LinkedList<>();
	
	public DepartmentEntity() {
		// TODO Auto-generated constructor stub
	}

	public DepartmentEntity(String name, String description, String principal, Date createTime, Date updateTime) {
		super();
		this.name = name;
		this.description = description;
		this.principal = principal;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public List<UserBaseEntity> getUsers() {
		return users;
	}

	public void setUsers(List<UserBaseEntity> users) {
		this.users = users;
	} 
	
}

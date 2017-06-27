package com.hm.ncgyy.entity.service;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;
import com.hm.ncgyy.entity.authority.UserBaseEntity;

@Entity
@Table(name = "service_declare")
public class DeclareEntity extends BaseEntity {
	
	public class DeclareStatus {
		public static final int NEW = 0;		// 新增
		public static final int ONLINE = 1;		// 上架
		public static final int DOWNLINE = 2;	// 下架
	}
	
	public class ApplyStatus {
		public static final int UNAPPLY = 0;	// 未申报
		public static final int APPLY = 1;		// 已申报
	}
	
	/**
	 * 申报项目名称
	 */
	private String title;
	
	/**
	 * 申报详细描述
	 */
	@Column(length = 4000)
	private String description;
	
	/**
	 * 申报开始时间
	 */
	private String startTime;
	
	/**
	 * 申报结束时间
	 */
	private String endTime;
	
	/**
	 * 申报状态
	 */
	private Integer status = DeclareStatus.NEW;
	
	/**
	 * 发布人
	 */
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private UserBaseEntity user;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "declare_id")
	List<DeclareFileEntity> fileList = new LinkedList<>();

	private Integer applyStatus = ApplyStatus.UNAPPLY;
	
	public DeclareEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public DeclareEntity(String title, String description, String startTime, String endTime, UserBaseEntity user, Date createTime, Date updateTime) {
		super();
		this.title = title;
		this.description = description;
		this.startTime = startTime;
		this.endTime = endTime;
		this.user = user;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public UserBaseEntity getUser() {
		return user;
	}

	public void setUser(UserBaseEntity user) {
		this.user = user;
	}

	public Integer getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(Integer applyStatus) {
		this.applyStatus = applyStatus;
	}

	public List<DeclareFileEntity> getFileList() {
		return fileList;
	}

	public void setFileList(List<DeclareFileEntity> fileList) {
		this.fileList = fileList;
	}
	
}

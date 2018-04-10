package com.hm.ncgyy.entity.website;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_item", indexes = { @Index(name = "index_website_item", columnList = "updateTime"),
		@Index(name = "index_website_item_status", columnList = "status, updateTime") })
public class ItemEntity extends BaseEntity {

	/** 项目状态 */
	public class ItemStatus {
		public static final int STATUS_NEW = 0; // 未申报
		public static final int STATUS_DECLARE = 1; // 申报中
		public static final int STATUS_END = 2; // 已截止
		public static final int STATUS_PUBLIC = 3; // 已公示
	}

	// 项目名称
	private String name;

	// 项目级别
	private String level;

	// 主管单位
	private String unit;

	// 截止时间
	private String deadline;

	// 项目内容
	@Column(length = 16777216)
	private String content;

	// 项目状态
	private Integer status = ItemStatus.STATUS_NEW;

	// 公示结果
	@Column(length = 16777216)
	private String result;

	/** 附件 */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "item_id")
	private List<ItemFileEntity> fileList = new LinkedList<>();

	public ItemEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItemEntity(String name, String level, String unit, String deadline, String content, Date createTime,
			Date updateTime) {
		super();
		this.name = name;
		this.level = level;
		this.unit = unit;
		this.deadline = deadline;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<ItemFileEntity> getFileList() {
		return fileList;
	}

	public void setFileList(List<ItemFileEntity> fileList) {
		this.fileList = fileList;
	}

}

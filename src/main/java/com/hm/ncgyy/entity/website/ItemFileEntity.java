package com.hm.ncgyy.entity.website;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_item_file")
public class ItemFileEntity extends BaseEntity {

	/** 关联项目 */
	@Column(name = "item_id")
	private Long itemId;
	
	/** 文件名称 */
	private String filename;
	
	/** 文件路径 */
	private String filepath;
	
	public ItemFileEntity() {
		// TODO Auto-generated constructor stub
	}

	public ItemFileEntity(Long itemId, String filename, String filepath, Date createTime, Date updateTime) {
		super();
		this.itemId = itemId;
		this.filename = filename;
		this.filepath = filepath;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}

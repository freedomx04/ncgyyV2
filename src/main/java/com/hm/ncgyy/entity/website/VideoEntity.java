package com.hm.ncgyy.entity.website;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_safty_video", indexes = {
	@Index(name = "index_website_safty_video_updateTime", columnList = "updateTime")
})
public class VideoEntity extends BaseEntity {
	
	/** 视频标题 */
	private String title;
	
	/** 视频路径 */
	private String path;
	
	/** 视频简介 */
	private String content;
	
	public VideoEntity() {
		// TODO Auto-generated constructor stub
	}

	public VideoEntity(String title, String path, String content, Date createTime, Date updateTime) {
		super();
		this.title = title;
		this.path = path;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

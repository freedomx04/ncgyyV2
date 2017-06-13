package com.hm.ncgyy.entity.issue;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "issue_article", indexes = {
		@Index(name = "index_issue_article_updateTime", columnList = "updateTime"), })
public class ArticleEntity extends BaseEntity {

	/**
	 * 文章类型
	 */
	public class ArticleType {
		public static final int PHOTONEWS = 1; // 图片新闻
		public static final int ANNOUNCE = 2; // 公示公告
		public static final int POLICY = 3; // 政策法规
		public static final int OVERVIEW = 4; // 工业信息
	}

	/**
	 * 类型
	 */
	private Integer type;

	/**
	 * 标题
	 */
	private String title;

	/**
	 * 来源
	 */
	private String source;

	/**
	 * 图片路径
	 */
	private String imagePath;

	/**
	 * 文章路径标识
	 */
	private String path;

	/**
	 * 内容
	 */
	private String content;

	public ArticleEntity() {
		super();
	}

	public ArticleEntity(Integer type, String title, String source, String imagePath, String path, Date createTime,
			Date updateTime) {
		super();
		this.type = type;
		this.title = title;
		this.source = source;
		this.imagePath = imagePath;
		this.path = path;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}

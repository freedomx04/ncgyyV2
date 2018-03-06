package com.hm.ncgyy.entity.website;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "website_article_file")
public class ArticleFileEntity extends BaseEntity {
	
	/** 关联文章 */
	@Column(name = "article_id")
    private Long articleId; 
	
	/** 文件名称 */
	private String filename;
	
	/** 文件路径 */
	private String filepath;
	
	public ArticleFileEntity() {
		// TODO Auto-generated constructor stub
	}

	public ArticleFileEntity(Long articleId, String filename, String filepath, Date createTime, Date updateTime) {
		super();
		this.articleId = articleId;
		this.filename = filename;
		this.filepath = filepath;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Long getArticleId() {
		return articleId;
	}

	public void setArticleId(Long articleId) {
		this.articleId = articleId;
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

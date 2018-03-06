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
@Table(name = "website_article", indexes = {
	@Index(name = "index_website_article_type", columnList = "type, updateTime") 
})
public class ArticleEntity extends BaseEntity {

	/** 文章类型 */
	public class ArticleType {
		public static final int PHOTONEWS = 1; // 图片新闻
		public static final int ANNOUNCE = 2; // 公示公告
		public static final int POLICY = 3; // 政策法规
		public static final int OVERVIEW = 4; // 工业信息
		
		public static final int BUSINESS_DYNAMIC = 10;	// 招商动态
		public static final int BUSINESS_POLICY = 11;	// 招商政策
		
		public static final int SAFTY_DYNAMIC = 20;		// 安全生产活动
	}

	/** 类型 */
	private Integer type;

	/** 标题 */
	private String title;

	/** 来源 */
	private String source;

	/** 图片路径 */
	private String imagePath;

	/** 内容 */
	@Column(length = 16777216)
	private String content;
	
	/** 附件 */
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "article_id")
	private List<ArticleFileEntity> fileList = new LinkedList<>();

	public ArticleEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArticleEntity(Integer type, String title, String source, String imagePath, String content, Date createTime,
			Date updateTime) {
		super();
		this.type = type;
		this.title = title;
		this.source = source;
		this.imagePath = imagePath;
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

	public List<ArticleFileEntity> getFileList() {
		return fileList;
	}

	public void setFileList(List<ArticleFileEntity> fileList) {
		this.fileList = fileList;
	}

}

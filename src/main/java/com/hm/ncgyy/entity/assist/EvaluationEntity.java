package com.hm.ncgyy.entity.assist;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "assist_evaluation")
public class EvaluationEntity extends BaseEntity {

	/**
	 * 受理速度
	 */
	private Integer accept = 0;

	/**
	 * 办理速度
	 */
	private Integer handle = 0;

	/**
	 * 办理结果
	 */
	private Integer result = 0;

	/**
	 * 评价内容
	 */
	private String content;

	public EvaluationEntity() {
		// TODO Auto-generated constructor stub
	}

	public EvaluationEntity(Integer accept, Integer handle, Integer result, String content, Date createTime,
			Date updateTime) {
		super();
		this.accept = accept;
		this.handle = handle;
		this.result = result;
		this.content = content;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public Integer getAccept() {
		return accept;
	}

	public void setAccept(Integer accept) {
		this.accept = accept;
	}

	public Integer getHandle() {
		return handle;
	}

	public void setHandle(Integer handle) {
		this.handle = handle;
	}

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

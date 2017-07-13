package com.hm.ncgyy.entity.office;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.hm.ncgyy.entity.BaseEntity;

@Entity
@Table(name = "office_email")
public class EmailEntity extends BaseEntity {
	
	/**
	 * 邮件标题
	 */
	private String title;
	
	
	
	

}

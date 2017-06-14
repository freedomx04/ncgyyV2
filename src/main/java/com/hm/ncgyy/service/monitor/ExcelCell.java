package com.hm.ncgyy.service.monitor;

public class ExcelCell {

	/**
	 * 单元格名称
	 */
	private String name;
	
	/**
	 * 单元格宽度
	 */
	private Integer width;
	
	/**
	 * 单元格标题
	 */
	private String title;
	
	public ExcelCell() {
		// TODO Auto-generated constructor stub
	}

	public ExcelCell(String name, Integer width, String title) {
		this.name = name;
		this.width = width;
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
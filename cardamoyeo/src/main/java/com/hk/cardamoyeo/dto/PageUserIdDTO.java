package com.hk.cardamoyeo.dto;

public class PageUserIdDTO {
	int startPage;
	int endPage;
	String user_id;
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public PageUserIdDTO() {};
	
	public PageUserIdDTO(int startPage, int endPage, String user_id) {
		this.startPage = startPage;
		this.endPage = endPage;
		this.user_id = user_id;
	}
	
	
	
}

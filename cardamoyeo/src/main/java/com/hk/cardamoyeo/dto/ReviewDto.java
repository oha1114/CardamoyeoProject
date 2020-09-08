package com.hk.cardamoyeo.dto;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class ReviewDto implements Serializable {
	private int review_seq;
	private int store_seq;
	private String user_id;
	private String store_star;
	private String review_content;
	private Timestamp review_date;
	private SDto SDto;
	private UserDto UserDto;
	
	
	
	
	public SDto getSDto() {
		return SDto;
	}





	public void setSDto(SDto sDto) {
		SDto = sDto;
	}





	public UserDto getUserDto() {
		return UserDto;
	}





	public void setUserDto(UserDto userDto) {
		UserDto = userDto;
	}





	public ReviewDto() {}
	
	
	
	
	
	public ReviewDto(int review_seq,int store_seq, String store_star, String review_content) {
		super();
		this.store_star = store_star;
		this.review_content = review_content;
	}





	public ReviewDto(int review_seq, int store_seq, String user_id, String store_star, String review_content,
			Timestamp review_date) {
		super();
		this.review_seq = review_seq;
		this.store_seq = store_seq;
		this.user_id = user_id;
		this.store_star = store_star;
		this.review_content = review_content;
		this.review_date = review_date;
	}
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getStore_star() {
		return store_star;
	}
	public void setStore_star(String store_star) {
		this.store_star = store_star;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	
	
	
	

}

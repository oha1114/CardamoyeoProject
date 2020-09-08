package com.hk.cardamoyeo.dto;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class LDto implements Serializable{
	private int like_list_seq;
	private String user_id;
	private int store_seq;
	private Timestamp like_regdate;
	private SDto SDto;
	
	public LDto() {
		
	}
	
	
	
	
	public LDto(String user_id, int store_seq) {
		super();
		this.user_id = user_id;
		this.store_seq = store_seq;
	}




	public LDto(int like_list_seq, String user_id, int store_seq, Timestamp like_regdate) {
		super();
		this.like_list_seq = like_list_seq;
		this.user_id = user_id;
		this.store_seq = store_seq;
		this.like_regdate = like_regdate;
		
	}



	public LDto(int like_list_seq, String user_id, int store_seq, Timestamp like_regdate, 
			com.hk.cardamoyeo.dto.SDto sDto) {
		super();
		this.like_list_seq = like_list_seq;
		this.user_id = user_id;
		this.store_seq = store_seq;
		this.like_regdate = like_regdate;
		
		SDto = sDto;
	}


	public int getLike_list_seq() {
		return like_list_seq;
	}



	public void setLike_list_seq(int like_list_seq) {
		this.like_list_seq = like_list_seq;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public int getStore_seq() {
		return store_seq;
	}



	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}



	public Timestamp getLike_regdate() {
		return like_regdate;
	}



	public void setLike_regdate(Timestamp like_regdate) {
		this.like_regdate = like_regdate;
	}






	public SDto getSDto() {
		return SDto;
	}
	public void setSDto(SDto SDto) {
		this.SDto = SDto;
	}
	
}

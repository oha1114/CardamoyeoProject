package com.hk.cardamoyeo.dto;

import java.util.Date;

public class ReplyDto {
	private int board_seq;
	private String user_id;
	private String reply_content;
	private Date reply_date;
	private String reply_seq;
	
	public ReplyDto() {
		
	}

	

	public ReplyDto(int board_seq, String user_id, String reply_content, Date reply_date, String reply_seq) {
		//super();
		this.board_seq = board_seq;
		this.user_id = user_id;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.reply_seq = reply_seq;
	}

	

	public int getBoard_seq() {
		return board_seq;
	}



	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getReply_content() {
		return reply_content;
	}



	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}



	public Date getReply_date() {
		return reply_date;
	}



	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}



	public String getReply_seq() {
		return reply_seq;
	}



	public void setReply_seq(String reply_seq) {
		this.reply_seq = reply_seq;
	}



	@Override
	public String toString() {
		return "ReplyDto [board_seq=" + board_seq + ", user_id=" + user_id + ", reply_content=" + reply_content
				+ ", reply_date=" + reply_date + ", reply_seq=" + reply_seq + "]";
	}
	
	
	
	
	
}

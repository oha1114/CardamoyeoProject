package com.hk.cardamoyeo.dto;

import java.util.Date;

public class NoticeDto {
	private int board_seq;
	private String user_id;
	private String board_title;
	private String board_content;
	private String read_count;
	private Date board_date;
	private String board_type;
	private String board_pass;
	private String board_read;
	private String user_type;
	
	public NoticeDto() {
		
	}
	
	public NoticeDto(int board_seq, String user_id, String board_title, String board_content, String read_count,
			Date board_date, String board_type, String board_pass, String board_read, String user_type) {
		super();
		this.board_seq = board_seq;
		this.user_id = user_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.read_count = read_count;
		this.board_date = board_date;
		this.board_type = board_type;
		this.board_pass = board_pass;
		this.board_read = board_read;
		this.user_type = user_type;
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

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getRead_count() {
		return read_count;
	}

	public void setRead_count(String read_count) {
		this.read_count = read_count;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getBoard_pass() {
		return board_pass;
	}

	public void setBoard_pass(String board_pass) {
		this.board_pass = board_pass;
	}

	public String getBoard_read() {
		return board_read;
	}

	public void setBoard_read(String board_read) {
		this.board_read = board_read;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	@Override
	public String toString() {
		return "NoticeDto [board_seq=" + board_seq + ", user_id=" + user_id + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", read_count=" + read_count + ", board_date=" + board_date
				+ ", board_type=" + board_type + ", board_pass=" + board_pass + ", board_read=" + board_read
				+ ", user_type=" + user_type + "]";
	}

	
}

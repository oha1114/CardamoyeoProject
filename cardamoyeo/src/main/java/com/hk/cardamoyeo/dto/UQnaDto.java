package com.hk.cardamoyeo.dto;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class UQnaDto implements Serializable{
	private int board_seq;
	private String user_id;
	private String board_title;
	private String board_content;
	private int read_content;
	private Timestamp board_date;
	private String board_pass;
	private String board_secret;
	private String board_read;
	private String board_type;
	private String user_type;
	private UserDto UserDto;
	private int commentCount;
	
	public UQnaDto() {
		
	}

	public UQnaDto(int board_seq, String user_id, String board_title, String board_content, int read_content,
			Timestamp board_date, String board_pass, String board_secret, String board_read, String board_type,
			String user_type, com.hk.cardamoyeo.dto.UserDto userDto, int commentCount) {
		super();
		this.board_seq = board_seq;
		this.user_id = user_id;
		this.board_title = board_title;
		this.board_content = board_content;
		this.read_content = read_content;
		this.board_date = board_date;
		this.board_pass = board_pass;
		this.board_secret = board_secret;
		this.board_read = board_read;
		this.board_type = board_type;
		this.user_type = user_type;
		UserDto = userDto;
		this.commentCount = commentCount;
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

	public int getRead_content() {
		return read_content;
	}

	public void setRead_content(int read_content) {
		this.read_content = read_content;
	}

	public Timestamp getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}

	public String getBoard_pass() {
		return board_pass;
	}

	public void setBoard_pass(String board_pass) {
		this.board_pass = board_pass;
	}

	public String getBoard_secret() {
		return board_secret;
	}

	public void setBoard_secret(String board_secret) {
		this.board_secret = board_secret;
	}

	public String getBoard_read() {
		return board_read;
	}

	public void setBoard_read(String board_read) {
		this.board_read = board_read;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public UserDto getUserDto() {
		return UserDto;
	}

	public void setUserDto(UserDto userDto) {
		UserDto = userDto;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}


	
	
}

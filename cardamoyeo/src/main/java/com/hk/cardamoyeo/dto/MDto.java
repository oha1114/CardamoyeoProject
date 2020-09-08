package com.hk.cardamoyeo.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MDto implements Serializable {
	
	private int store_seq;
	private int menu_num;
	private String one_time;
	private String two_time;
	private String one_day;
	private String month_time;
	private String store_money;
	
	
	public MDto() {}
	
	
	public MDto(int store_seq, int menu_num, String one_time, String two_time, String one_day, String month_time,
			String store_money) {
		super();
		this.store_seq = store_seq;
		this.menu_num = menu_num;
		this.one_time = one_time;
		this.two_time = two_time;
		this.one_day = one_day;
		this.month_time = month_time;
		this.store_money = store_money;
	}
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public int getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}
	public String getOne_time() {
		return one_time;
	}
	public void setOne_time(String one_time) {
		this.one_time = one_time;
	}
	public String getTwo_time() {
		return two_time;
	}
	public void setTwo_time(String two_time) {
		this.two_time = two_time;
	}
	public String getOne_day() {
		return one_day;
	}
	public void setOne_day(String one_day) {
		this.one_day = one_day;
	}
	public String getMonth_time() {
		return month_time;
	}
	public void setMonth_time(String month_time) {
		this.month_time = month_time;
	}
	public String getStore_money() {
		return store_money;
	}
	public void setStore_money(String store_money) {
		this.store_money = store_money;
	}
	
	
	
	

}

package com.hk.cardamoyeo.dto;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class RDto implements Serializable{
	private int res_seq;
	private String user_id;
	private String car_num;
	private Timestamp pay_date;
	private Timestamp res_date;
	private String res_pay;
	private String res_success;
	private int store_seq;
	private String res_intime;
	private String menu_type;
	private com.hk.cardamoyeo.dto.SDto SDto;
	
	public RDto() {
		
	}
	
	
	
	public RDto(String user_id, int store_seq) {
		super();
		this.user_id = user_id;
		this.store_seq = store_seq;
	}



	public RDto(int res_seq, String user_id, String car_num, Timestamp pay_date, Timestamp res_date, String res_pay,
			String res_success, int store_seq, String res_intime, String menu_type, com.hk.cardamoyeo.dto.SDto sDto) {
		super();
		this.res_seq = res_seq;
		this.user_id = user_id;
		this.car_num = car_num;
		this.pay_date = pay_date;
		this.res_date = res_date;
		this.res_pay = res_pay;
		this.res_success = res_success;
		this.store_seq = store_seq;
		this.res_intime = res_intime;
		this.menu_type = menu_type;
		SDto = sDto;
	}
	
	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public Timestamp getPay_date() {
		return pay_date;
	}
	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}
	public Timestamp getRes_date() {
		return res_date;
	}
	public void setRes_date(Timestamp res_date) {
		this.res_date = res_date;
	}
	public String getRes_pay() {
		return res_pay;
	}
	public void setRes_pay(String res_pay) {
		this.res_pay = res_pay;
	}
	public String getRes_success() {
		return res_success;
	}
	public void setRes_success(String res_success) {
		this.res_success = res_success;
	}
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public String getRes_intime() {
		return res_intime;
	}
	public void setRes_intime(String res_intime) {
		this.res_intime = res_intime;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}
	
	public com.hk.cardamoyeo.dto.SDto getSDto() {
		return SDto;
	}
	public void setSDto(com.hk.cardamoyeo.dto.SDto sDto) {
		SDto = sDto;
	}
	
	
	
	
}

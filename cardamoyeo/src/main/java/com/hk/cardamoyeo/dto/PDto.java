package com.hk.cardamoyeo.dto;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class PDto implements Serializable {
	
	private int res_seq;
	private int store_seq;
	private String user_id;
	private String car_num;
	private Timestamp pay_date;
	private Timestamp res_date;
	private String res_pay;
	private String res_success;
	private String res_intime;
	private String menu_type;
	
	
	public PDto() {}
	

	
	
   
	public PDto(int res_seq, Timestamp pay_date, String res_success) {
		super();
		this.res_seq = res_seq;
		this.pay_date = pay_date;
		this.res_success = res_success;
	}





	public PDto(int res_seq, int store_seq, String car_num, Timestamp res_date, String res_pay, String res_intime,
			String menu_type) {
		
		super();
		this.res_seq = res_seq;
		this.store_seq = store_seq;
		this.car_num = car_num;
		this.res_date = res_date;
		this.res_pay = res_pay;
		this.res_intime = res_intime;
		this.menu_type = menu_type;
	}

	public PDto(int res_seq, int store_seq, String user_id, String car_num, Timestamp pay_date, Timestamp res_date,
			String res_pay, String res_success, String res_intime, String menu_type) {
		super();
		this.res_seq = res_seq;
		this.store_seq = store_seq;
		this.user_id = user_id;
		this.car_num = car_num;
		this.pay_date = pay_date;
		this.res_date = res_date;
		this.res_pay = res_pay;
		this.res_success = res_success;
		this.res_intime = res_intime;
		this.menu_type = menu_type;
	}
	public PDto(int res_seq, int store_seq, String user_id, String car_num,Timestamp res_date, String res_pay, String res_intime, String menu_type) {
		// TODO Auto-generated constructor stub
	}

	
			
			
	




	public PDto(int res_seq, String user_id) {
		super();
		this.res_seq = res_seq;
		this.user_id = user_id;
	}





	public PDto(int store_seq, String user_id, String car_num, Timestamp res_date, String res_pay, String res_intime,
			String menu_type) {
		super();
		this.store_seq = store_seq;
		this.user_id = user_id;
		this.car_num = car_num;
		this.res_date = res_date;
		this.res_pay = res_pay;
		this.res_intime = res_intime;
		this.menu_type = menu_type;
	}





	public int getRes_seq() {
		return res_seq;
	}
	public void setRes_seq(int res_seq) {
		this.res_seq = res_seq;
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
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	

}

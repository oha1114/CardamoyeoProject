package com.hk.cardamoyeo.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SDto implements Serializable{
	private int store_seq;
	private String user_id;
	private String store_name;
	private String store_space;
	private String store_address;
	private String store_content;
	private String store_phone;
	private String store_bank;
	private String store_account;
	private String store_license_number;
	private String store_license_image;
	private String store_latitude;
	private String store_longitude;
	private String store_time_open;
	private String store_time_close;
	
	private FDto fdto;//store_image table
	private MDto mdto;//store_menu table
	private PDto pdto;//store_res table


	
	
	
	


	@Override
	public String toString() {
		return "SDto [store_seq=" + store_seq + ", user_id=" + user_id + ", store_name=" + store_name + ", store_space="
				+ store_space + ", store_address=" + store_address + ", store_content=" + store_content
				+ ", store_phone=" + store_phone + ", store_bank=" + store_bank + ", store_account=" + store_account
				+ ", store_license_number=" + store_license_number + ", store_license_image=" + store_license_image
				 + ", store_latitude=" + store_latitude
				+ ", store_longitude=" + store_longitude  + ", store_time_open="
				+ store_time_open + ", store_time_close=" + store_time_close 
				+   ", fdto=" + fdto + ", mdto=" + mdto + ", pdto=" + pdto + "]";
	}


	public PDto getPdto() {
		return pdto;
	}


	public void setPdto(PDto pdto) {
		this.pdto = pdto;
	}


	public FDto getFdto() {
		return fdto;
	}


	public void setFdto(FDto fdto) {
		this.fdto = fdto;
	}


	public MDto getMdto() {
		return mdto;
	}


	public void setMdto(MDto mdto) {
		this.mdto = mdto;
	}


	//디폴트 생성자
	public SDto() {}
	
	
	//마이페이지-매장관리 리스트--test
	public SDto(int store_seq, String store_name) {
		
		this.store_seq = store_seq;
		
		this.store_name = store_name;
	}


	public SDto(int store_seq, String user_id, String store_name, String store_space, String store_address,
			String store_content, String store_phone, String store_bank, String store_account,
			String store_license_number, String store_license_image,  String store_latitude,
			String store_longitude,String store_time_open, String store_time_close
			) {
		
		this.store_seq = store_seq;
		this.user_id = user_id;
		this.store_name = store_name;
		this.store_space = store_space;
		this.store_address = store_address;
		this.store_content = store_content;
		this.store_phone = store_phone;
		this.store_bank = store_bank;
		this.store_account = store_account;
		this.store_license_number = store_license_number;
		this.store_license_image = store_license_image;
		
		this.store_latitude = store_latitude;
		this.store_longitude = store_longitude;
	
		this.store_time_open = store_time_open;
		this.store_time_close = store_time_close;
	
	}

	//test
	public SDto( String store_name, String store_space, String store_address, String store_content, String store_phone,
			String store_bank, String store_account, String store_time_open, String store_time_close) {
	
		
		this.store_name = store_name;
		this.store_space = store_space;
		this.store_address = store_address;
		this.store_content = store_content;
		this.store_phone = store_phone;
		this.store_bank = store_bank;
		this.store_account = store_account;
		this.store_time_open = store_time_open;
		this.store_time_close = store_time_close;
	}

	public SDto(int store_seq, String store_name, String store_space, String store_address, String store_content, String store_phone,
			String store_bank, String store_account, String store_time_open, String store_time_close) {
	
		this.store_seq = store_seq;
		this.store_name = store_name;
		this.store_space = store_space;
		this.store_address = store_address;
		this.store_content = store_content;
		this.store_phone = store_phone;
		this.store_bank = store_bank;
		this.store_account = store_account;
		this.store_time_open = store_time_open;
		this.store_time_close = store_time_close;
	}
	
	public SDto(int store_seq, String store_name, String store_space, String store_address, String store_content, String store_phone,
			String store_time_open, String store_time_close) {
	
		this.store_seq = store_seq;
		this.store_name = store_name;
		this.store_space = store_space;
		this.store_address = store_address;
		this.store_content = store_content;
		this.store_phone = store_phone;
		this.store_time_open = store_time_open;
		this.store_time_close = store_time_close;
	}
	
	//임시
		public SDto(String user_id, String store_name, String store_space, String store_address, String store_latitude, String store_longitude, String store_content, String store_phone,
				String store_bank, String store_account, String store_time_open, String store_time_close) {
		
			this.user_id = user_id;
			this.store_name = store_name;
			this.store_space = store_space;
			this.store_address = store_address;
			this.store_latitude = store_latitude;
			this.store_longitude = store_longitude;		
			this.store_content = store_content;
			this.store_phone = store_phone;
			this.store_bank = store_bank;
			this.store_account = store_account;
			this.store_time_open = store_time_open;
			this.store_time_close = store_time_close;
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


	public String getStore_name() {
		return store_name;
	}


	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}


	public String getStore_space() {
		return store_space;
	}


	public void setStore_space(String store_space) {
		this.store_space = store_space;
	}


	public String getStore_address() {
		return store_address;
	}


	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}


	public String getStore_content() {
		return store_content;
	}


	public void setStore_content(String store_content) {
		this.store_content = store_content;
	}


	public String getStore_phone() {
		return store_phone;
	}


	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}


	public String getStore_bank() {
		return store_bank;
	}


	public void setStore_bank(String store_bank) {
		this.store_bank = store_bank;
	}


	public String getStore_account() {
		return store_account;
	}


	public void setStore_account(String store_account) {
		this.store_account = store_account;
	}


	public String getStore_license_number() {
		return store_license_number;
	}


	public void setStore_license_number(String store_license_number) {
		this.store_license_number = store_license_number;
	}


	public String getStore_license_image() {
		return store_license_image;
	}


	public void setStore_license_image(String store_license_image) {
		this.store_license_image = store_license_image;
	}




	public String getStore_latitude() {
		return store_latitude;
	}


	public void setStore_latitude(String store_latitude) {
		this.store_latitude = store_latitude;
	}


	public String getStore_longitude() {
		return store_longitude;
	}


	public void setStore_longitude(String store_longitude) {
		this.store_longitude = store_longitude;
	}




	public String getStore_time_open() {
		return store_time_open;
	}


	public void setStore_time_open(String store_time_open) {
		this.store_time_open = store_time_open;
	}


	public String getStore_time_close() {
		return store_time_close;
	}


	public void setStore_time_close(String store_time_close) {
		this.store_time_close = store_time_close;
	}


	


	


	
	
}	


	
	



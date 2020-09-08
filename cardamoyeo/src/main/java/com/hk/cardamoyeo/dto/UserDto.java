package com.hk.cardamoyeo.dto;

import java.io.Serializable;
import java.sql.Timestamp;

@SuppressWarnings("serial")
public class UserDto implements Serializable{
	private int user_num;
	private String user_id;
	private String user_name;
	private String user_nic;
	private String user_pass;
	private String user_phone;
	private String user_email;
	private String user_address;
	private String user_gender;
	private Timestamp user_regdate;
	private String user_role;
	private String user_out;
	private String owner_ok;
	private String store_license_number;
	private String store_license_image;
	private String join_ok;
	
	@Override
	public String toString() {
		return "UserDto [user_num=" + user_num + ", user_id=" + user_id + ", user_name=" + user_name + ", user_nic="
				+ user_nic + ", user_pass=" + user_pass + ", user_phone=" + user_phone + ", user_email=" + user_email
				+ ", user_address=" + user_address + ", user_gender=" + user_gender + ", user_regdate=" + user_regdate
				+ ", user_role=" + user_role + ", user_out=" + user_out + ", owner_ok=" + owner_ok
				+ ", store_license_number=" + store_license_number + ", store_license_image=" + store_license_image
				+ ", join_ok=" + join_ok + "]";
	}
	
	public UserDto() {
		
	}
	
	public String getOwner_ok() {
		return owner_ok;
	}

	public void setOwner_ok(String owner_ok) {
		this.owner_ok = owner_ok;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nic() {
		return user_nic;
	}

	public void setUser_nic(String user_nic) {
		this.user_nic = user_nic;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public Timestamp getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Timestamp user_regdate) {
		this.user_regdate = user_regdate;
	}

	public String getUser_role() {
		return user_role;
	}

	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}

	public String getUser_out() {
		return user_out;
	}

	public void setUser_out(String user_out) {
		this.user_out = user_out;
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

	public String getJoin_ok() {
		return join_ok;
	}

	public void setJoin_ok(String join_ok) {
		this.join_ok = join_ok;
	}

	public UserDto(int user_num, String user_id, String user_name, String user_nic, String user_pass, String user_phone,
			String user_email, String user_address, String user_gender, Timestamp user_regdate, String user_role,
			String user_out, String owner_ok, String store_license_number, String store_license_image, String join_ok) {
		super();
		this.user_num = user_num;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_nic = user_nic;
		this.user_pass = user_pass;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_address = user_address;
		this.user_gender = user_gender;
		this.user_regdate = user_regdate;
		this.user_role = user_role;
		this.user_out = user_out;
		this.owner_ok = owner_ok;
		this.store_license_number = store_license_number;
		this.store_license_image = store_license_image;
		this.join_ok = join_ok;
	}

	

	
}

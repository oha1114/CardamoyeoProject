package com.hk.cardamoyeo.dao;

import java.util.List;

import com.hk.cardamoyeo.dto.UserDto;

public interface mgdao {
	public List<UserDto> getAllList(String keyword);
	public List<UserDto> getAllList2(String keyword);
	
	//public List<UserDto> getAllList();
	//public List<UserDto> getAllList2();
	
	public boolean UserDelete(int user_num);
	public boolean OwnerDelete(int user_num);
}

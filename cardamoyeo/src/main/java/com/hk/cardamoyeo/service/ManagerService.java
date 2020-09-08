package com.hk.cardamoyeo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.ManagerDao;
import com.hk.cardamoyeo.dto.UserDto;

@Service
public class ManagerService implements MGService{
	@Autowired
	private ManagerDao dao;

	@Override
	public List<UserDto> getAllList(String keyword) {
		return dao.getAllList(keyword);
	}
	
	
	/*@Override
	public List<UserDto> getAllList() {
		return dao.getAllList();
	}*/
	

	@Override
	public List<UserDto> getAllList2(String keyword) {
		return dao.getAllList2(keyword);
	}
	
	/*@Override
	public List<UserDto> getAllList2() {
		return dao.getAllList2();
	}*/

	@Override
	public boolean UserDelete(int user_num) {
		return dao.UserDelete(user_num);
	}

	@Override
	public boolean OwnerDelete(int user_num) {
		return dao.OwnerDelete(user_num);
	}
}

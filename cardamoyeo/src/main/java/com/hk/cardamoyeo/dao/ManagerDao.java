package com.hk.cardamoyeo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.UserDto;

@Repository
public class ManagerDao implements mgdao{
private String nameSpace="com.hk.cardamoyeo.dao.mgdao.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public ManagerDao() {

	}
	
	
	public List<UserDto> getAllList(String keyword){
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		List<UserDto> result = sqlSession.selectList(nameSpace+"UserManager", map);
		return result;
	}
	
	
	/*public List<UserDto> getAllList(){
		List<UserDto> result = sqlSession.selectList(nameSpace+"UserManager");
		return result;
	}*/

	@Override
	public List<UserDto> getAllList2(String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		List<UserDto> result = sqlSession.selectList(nameSpace+"OwnerManager", map);
		return result;
	}
	
	/*@Override
	public List<UserDto> getAllList2() {
		List<UserDto> result = sqlSession.selectList(nameSpace+"OwnerManager");
		return result;
	}*/

	@Override
	public boolean UserDelete(int user_num) {
		int decount = sqlSession.update(nameSpace + "UserDelete", user_num);
		return decount>0?true:false;
	}

	@Override
	public boolean OwnerDelete(int user_num) {
		int decount = sqlSession.update(nameSpace + "OwnerDelete", user_num);
		return decount>0?true:false;
	}
}

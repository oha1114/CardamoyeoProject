package com.hk.cardamoyeo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.SDto;

@Repository
public class MapDao implements mdao{
	private String nameSpace="com.hk.cardamoyeo.dao.mdao.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public MapDao() {

	}

	/*@Override
	public List<SDto> getAllList() {
		List<SDto> result = sqlSession.selectList(nameSpace + "MapDao");
		return result;
	}*/
	
	@Override
	public List<SDto> getAllList(String keyword) {
		Map<String, String> map = new HashMap<String, String>();	
		map.put("keyword", keyword);
		List<SDto> result = sqlSession.selectList(nameSpace + "MapDao", map);
		return result;
	}
}

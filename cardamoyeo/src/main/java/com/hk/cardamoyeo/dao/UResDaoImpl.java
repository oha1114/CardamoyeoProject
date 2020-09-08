package com.hk.cardamoyeo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.PageUserIdDTO;
import com.hk.cardamoyeo.dto.RDto;

@Repository
public class UResDaoImpl implements UResDao{
	@Autowired
	private SqlSession sqlSession;
	
	public UResDaoImpl() {
		
	}
	
	@Override
	public Integer resListCount() {
		Integer result = sqlSession.selectOne("resListCount");
		return result;
	}

	@Override
	public ArrayList<RDto> resDao(int page, int limit, String user_id) {
		int startRow = (page -1) * limit +1;
		int endRow = startRow + limit -1;
		PageUserIdDTO dto = new PageUserIdDTO(startRow, endRow, user_id);
		
		System.out.println("user_id 값 : " + user_id);
		ArrayList<RDto> result = (ArrayList)sqlSession.selectList("resDao",dto);
		return result;
	}
	
}

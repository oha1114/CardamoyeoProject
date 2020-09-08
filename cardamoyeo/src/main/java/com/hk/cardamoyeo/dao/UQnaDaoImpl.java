package com.hk.cardamoyeo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hk.cardamoyeo.dto.PageUserIdDTO;
import com.hk.cardamoyeo.dto.UQnaDto;

public class UQnaDaoImpl implements UQnaDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	public UQnaDaoImpl() {
		
	}

	@Override
	public ArrayList<UQnaDto> uQnalistDao(int page, int limit, String user_id) {
		int startRow = (page -1) * limit +1;
		int endRow = startRow + limit -1;
		PageUserIdDTO dto = new PageUserIdDTO(startRow, endRow, user_id);
		
		System.out.println("user_id 값 : " + user_id);
		ArrayList<UQnaDto> result = (ArrayList)sqlSession.selectList("uQnaListDao",dto);
		return result;
	}

	@Override
	public Integer qnaListCount() {
		Integer result = sqlSession.selectOne("qnaListCount");
		return result;
	}

}

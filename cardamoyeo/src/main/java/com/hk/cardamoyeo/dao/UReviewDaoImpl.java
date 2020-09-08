package com.hk.cardamoyeo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hk.cardamoyeo.dto.PageUserIdDTO;
import com.hk.cardamoyeo.dto.ReviewDto;

public class UReviewDaoImpl implements UReviewDao {

	@Autowired
	private SqlSession sqlSession;
	
	public UReviewDaoImpl() {
		
	}
	
	@Override
	public ArrayList<ReviewDto> rvlistDao(int page, int limit, String user_id) {
		int startRow = (page -1) * limit +1;
		int endRow = startRow + limit -1;
		PageUserIdDTO dto = new PageUserIdDTO(startRow, endRow, user_id);
		
		System.out.println("user_id 값 : " + user_id);
		ArrayList<ReviewDto> result = (ArrayList)sqlSession.selectList("rvListDao",dto);
		return result;
	}

	@Override
	public Integer rvListCount() {
		Integer result = sqlSession.selectOne("rvListCount");
		return result;
	}

	@Override
	public void rvDelDao(int review_seq) {
		sqlSession.delete("rvDelDao", review_seq);
	}

	

}

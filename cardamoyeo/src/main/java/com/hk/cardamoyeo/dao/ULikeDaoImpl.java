package com.hk.cardamoyeo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.PageUserIdDTO;

@Repository
public class ULikeDaoImpl implements ULikeDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ULikeDaoImpl() {
		
	}

	@Override
	public ArrayList<LDto> likeListDao(int page, int limit,String user_id) {
		int startRow = (page -1) * limit +1;
		int endRow = startRow + limit -1;
		
		PageUserIdDTO dto = new PageUserIdDTO(startRow, endRow, user_id);
		
		System.out.println("user_id 값 : " + user_id);
		ArrayList<LDto> result = (ArrayList)sqlSession.selectList("listDao",dto);
		return result;
	}

	@Override
	public void deleteDao(int likeListSeq) {
		sqlSession.delete("deleteDao", likeListSeq);
	}

	@Override
	public Integer likeListCount() {
		Integer result = sqlSession.selectOne("likeListCount");
		return result;
	}

	

}

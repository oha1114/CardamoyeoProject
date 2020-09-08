package com.hk.cardamoyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.ReplyDto;

@Repository
public class ReplyDao implements rdao{

private String nameSpace="com.hk.cardamoyeo.dao.rdao.";
	
	@Autowired
	private SqlSession sqlSession;	
	
	public ReplyDao() {
		
	}
	
	@Override
	public List<ReplyDto> readReply(int seq) throws Exception {
		List<ReplyDto> result = sqlSession.selectList(nameSpace + "ReplyDao", seq);
		return result;
	}

	@Override
	public boolean writeReply(ReplyDto dto) throws Exception {
		int count = sqlSession.insert(nameSpace + "writeReply", dto);
		return count>0?true:false;
		
	}

	/*@Override
	public boolean updateReply(ReplyDto dto) throws Exception {
		int modicount = sqlSession.update(nameSpace + "QUModify", dto);
		return modicount>0?true:false;
	}*/

	@Override
	public boolean deleteReply(ReplyDto dto) throws Exception {
		int decount = sqlSession.update(nameSpace + "QUDelete", dto);
		return decount>0?true:false;
	}
	
}

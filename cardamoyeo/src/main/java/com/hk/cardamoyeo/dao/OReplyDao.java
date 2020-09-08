package com.hk.cardamoyeo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.OReplyDto;

@Repository
public class OReplyDao implements ordao{
private String nameSpace="com.hk.cardamoyeo.dao.ordao.";
	
	@Autowired
	private SqlSession sqlSession;	
	
	public OReplyDao() {
		
	}

	@Override
	public List<OReplyDto> readOReply(int seq) throws Exception {
		List<OReplyDto> result = sqlSession.selectList(nameSpace + "OReplyDao", seq);
		return result;
	}

	@Override
	public boolean writeOReply(OReplyDto dto) throws Exception {
		int count = sqlSession.insert(nameSpace + "writeOReply", dto);
		return count>0?true:false;
	}

	@Override
	public boolean deleteOReply(OReplyDto dto) throws Exception {
		int decount = sqlSession.update(nameSpace + "OQUDelete", dto);
		return decount>0?true:false;
	}
}

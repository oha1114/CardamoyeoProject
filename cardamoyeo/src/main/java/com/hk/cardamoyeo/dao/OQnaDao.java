package com.hk.cardamoyeo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.OQnaDto;

@Repository
public class OQnaDao implements oqdao{

	private String nameSpace="com.hk.cardamoyeo.dao.oqdao.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public OQnaDao() {
		
	}

	@Override
	public int getCount() {
		return sqlSession.selectOne(nameSpace+"pcount");
	}
	
	@Override
	public List<OQnaDto> getAllList(String pNum, int pcount) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pNum", pNum);
		map.put("pcount",pcount+"");
		List<OQnaDto> result = sqlSession.selectList(nameSpace+"OQnaDao", map);
		return result;
	}

	@Override
	public boolean OQuWrite(OQnaDto dto) {
		int count = sqlSession.insert(nameSpace + "OQuWrite", dto);
		return count>0?true:false;
	}

	@Override
	public OQnaDto getOUBoard(OQnaDto dto) {
		Map<String, OQnaDto> map = new HashMap<String, OQnaDto>();
		map.put("dto", dto);
		OQnaDto result = sqlSession.selectOne(nameSpace + "detailOU", map);
		return result;
	}

	@Override
	public OQnaDto getOUMBoard(int seq) {
		OQnaDto result = sqlSession.selectOne(nameSpace + "modidetailOU", seq);
		return result;
	}

	@Override
	public boolean OQUModify(OQnaDto dto) {
		int modicount = sqlSession.update(nameSpace + "OQUModify", dto);
		return modicount>0?true:false;
	}

	@Override
	public boolean OQUDelete(int seqs) {
		int decount = sqlSession.update(nameSpace + "OQUDelete", seqs);
		return decount>0?true:false;
	}
	
}

package com.hk.cardamoyeo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.OQnaDto;
import com.hk.cardamoyeo.dto.QnaDto;
@Repository
public class QnaDao implements qdao{
	
private String nameSpace="com.hk.cardamoyeo.dao.qdao.";
	
	@Autowired
	private SqlSession sqlSession;
//	private SqlSessionTemplate sqlSessions;
	
	public QnaDao() {

	}
	
	@Override
	public int getCount() {
		return sqlSession.selectOne(nameSpace+"pcount");
	}
	
	@Override
	public List<QnaDto> getAllList(String pNum, int pcount){	
		Map<String, String> map = new HashMap<String, String>();
		map.put("pNum", pNum);
		map.put("pcount",pcount+"");
		List<QnaDto> result = sqlSession.selectList(nameSpace+"QnaDao", map);
		return result;
	}
	@Override
	public boolean QuWrite(QnaDto dto) {
		int count=sqlSession.insert(nameSpace + "QuWrite", dto);
		return count>0?true:false;
	}
	@Override
	public QnaDto getUBoard(QnaDto dto) {
		Map<String, QnaDto> map = new HashMap<String, QnaDto>();
		map.put("dto", dto);
		QnaDto result = sqlSession.selectOne(nameSpace+"detailU",map);
		return result;
	}
	@Override
	public QnaDto getUMBoard(int seq) {
		QnaDto result = sqlSession.selectOne(nameSpace + "modidetailU", seq);
		return result;
	}
	@Override
	public boolean QUModify(QnaDto dto) {
		int modicount = sqlSession.update(nameSpace + "QUModify", dto);
		return modicount>0?true:false;
	}
	@Override
	public boolean QUDelete(int seqs) {
		int decount = sqlSession.update(nameSpace + "QUDelete", seqs);
		return decount>0?true:false;
	}
	
	
	
}

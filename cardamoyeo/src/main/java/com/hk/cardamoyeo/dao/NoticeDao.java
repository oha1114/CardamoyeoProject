package com.hk.cardamoyeo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.NoticeDto;

@Repository
public class NoticeDao implements idao{

	private String nameSpace="com.hk.cardamoyeo.dao.idao.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public NoticeDao() {

	}	
	 
	@Override
	public int getCount() {
		return sqlSession.selectOne(nameSpace+"pcount");
	}
	
	 @Override
		public List<NoticeDto> getAllList(String pNum, int pcount){
			Map<String, String> map = new HashMap<String, String>();
			map.put("pNum", pNum);
			map.put("pcount",pcount+"");
			List<NoticeDto> result = sqlSession.selectList(nameSpace+"NoticeDao", map);
			return result;
		}

	@Override
	public boolean boardWrite(NoticeDto dto) {
		int count=sqlSession.insert(nameSpace+"boardWrite", dto);
		return count>0?true:false;
	}

	@Override
	public NoticeDto getNBoard(int seq) {
		
		NoticeDto result = sqlSession.selectOne(nameSpace+"detailBoard",seq);
		return result;
	}
	
	@Override
	public NoticeDto getMBoard(int seqs) {
		NoticeDto result = sqlSession.selectOne(nameSpace + "modidetailBoard", seqs);
		return result;
	}

	@Override
	public boolean boardModify(NoticeDto dto) {
		int modicount = sqlSession.update(nameSpace + "boardModify", dto);
		return modicount>0?true:false;
	}

	@Override
	public boolean boardDelete(int seqs) {
		int decount = sqlSession.update(nameSpace + "boardDelete", seqs);
		return decount>0?true:false;
	}
	
	@Override
	public boolean readCount(int seq) {
		int count=sqlSession.update(nameSpace + "readCount", seq);
		return count>0?true:false;
	}
}

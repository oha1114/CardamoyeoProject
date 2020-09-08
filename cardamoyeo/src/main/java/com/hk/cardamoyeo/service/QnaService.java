package com.hk.cardamoyeo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.QnaDao;
import com.hk.cardamoyeo.dto.QnaDto;

@Service
public class QnaService  implements QService{
	@Autowired
	 private QnaDao dao;

	@Override
	public int getCount() {
		return dao.getCount(); 
	}
	
	@Override
	public List<QnaDto> getAllList(String pNum, int pcount) {		
		return dao.getAllList(pNum, pcount);
	}

	@Override
	public boolean QuWrite(QnaDto dto) {
		return dao.QuWrite(dto);
	}

	@Override
	public QnaDto getUBoard(QnaDto dto) {
		return dao.getUBoard(dto);
	}

	@Override
	public QnaDto getUMBoard(int seq) {
		return dao.getUMBoard(seq);
	}

	@Override
	public boolean QUModify(QnaDto dto) {
		return dao.QUModify(dto);
	}

	@Override
	public boolean QUDelete(int seqs) {
		return dao.QUDelete(seqs);
	}
}

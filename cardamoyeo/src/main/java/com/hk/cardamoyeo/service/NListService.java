package com.hk.cardamoyeo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.NoticeDao;
import com.hk.cardamoyeo.dto.NoticeDto;

@Service
public class NListService implements NService{

	@Autowired
	 private NoticeDao dao;

//	@Transactional

	
	@Override
	public int getCount() {
		return dao.getCount(); 
	}

	@Override
	public List<NoticeDto> getAllList(String pNum, int pcount) {
		return dao.getAllList(pNum, pcount);
	}

	@Override
	public boolean boardWrite(NoticeDto dto) {
		return dao.boardWrite(dto);
	}

	@Override
	public NoticeDto getNBoard(int seq) {
		return dao.getNBoard(seq);
	}

	@Override
	public NoticeDto getMBoard(int seq) {
		return dao.getMBoard(seq);
	}
	
	@Override
	public boolean boardModify(NoticeDto dto) {
		return dao.boardModify(dto);
	}


	@Override
	public boolean readCount(int seq) {
		return dao.readCount(seq);
	}

	@Override
	public boolean boardDelete(int seqs) {
		return dao.boardDelete(seqs);
	}


	



	

	

	

}

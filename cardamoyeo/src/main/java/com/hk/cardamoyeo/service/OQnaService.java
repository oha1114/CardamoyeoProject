package com.hk.cardamoyeo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.OQnaDao;
import com.hk.cardamoyeo.dto.OQnaDto;

@Service
public class OQnaService implements OQService{
	@Autowired
	private OQnaDao dao;

	@Override
	public int getCount() {
		return dao.getCount(); 
	}
	
	@Override
	public List<OQnaDto> getAllList(String pNum, int pcount) {
		return dao.getAllList(pNum, pcount);
	}

	@Override
	public boolean OQuWrite(OQnaDto dto) {		
		return dao.OQuWrite(dto);
	}

	@Override
	public OQnaDto getOUBoard(OQnaDto dto) {
		return dao.getOUBoard(dto);
	}

	@Override
	public OQnaDto getOUMBoard(int seq) {
		return dao.getOUMBoard(seq);
	}

	@Override
	public boolean OQUModify(OQnaDto dto) {
		return dao.OQUModify(dto);
	}
	
	@Override
	public boolean OQUDelete(int seqs) {
		return dao.OQUDelete(seqs);
	}

}

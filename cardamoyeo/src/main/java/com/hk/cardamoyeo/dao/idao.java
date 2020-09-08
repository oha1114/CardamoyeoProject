package com.hk.cardamoyeo.dao;

import java.util.List;

import com.hk.cardamoyeo.dto.NoticeDto;

public interface idao {

	public int getCount();
	public List<NoticeDto> getAllList(String pNum, int pcount);
	public boolean boardWrite(NoticeDto dto);
	public NoticeDto getNBoard(int seq);	
	public NoticeDto getMBoard(int seqs);	
	public boolean boardModify(NoticeDto dto);
	public boolean boardDelete(int seqs);
	public boolean readCount(int seq);
}

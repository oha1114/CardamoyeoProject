package com.hk.cardamoyeo.dao;

import java.util.List;

import com.hk.cardamoyeo.dto.QnaDto;

public interface qdao {
	public int getCount();
	public List<QnaDto> getAllList(String pNum, int pcount);
	public boolean QuWrite(QnaDto dto);
	public QnaDto getUBoard(QnaDto dto);
	public QnaDto getUMBoard(int seq);
	public boolean QUModify(QnaDto dto);
	public boolean QUDelete(int seqs);
}

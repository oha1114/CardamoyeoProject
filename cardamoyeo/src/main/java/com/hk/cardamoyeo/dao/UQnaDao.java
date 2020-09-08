package com.hk.cardamoyeo.dao;

import java.util.ArrayList;

import com.hk.cardamoyeo.dto.UQnaDto;

public interface UQnaDao {
	public ArrayList<UQnaDto> uQnalistDao(int page, int limit,String user_id);
	//public void rvDelDao(int review_seq);
	public Integer qnaListCount();
}

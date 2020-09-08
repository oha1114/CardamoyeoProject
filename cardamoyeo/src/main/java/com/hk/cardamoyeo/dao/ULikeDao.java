package com.hk.cardamoyeo.dao;

import java.util.ArrayList;

import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.RDto;

public interface ULikeDao {
	public ArrayList<LDto> likeListDao(int page, int limit,String user_id);
	public void deleteDao(int likeListSeq);
	public Integer likeListCount();
	
}

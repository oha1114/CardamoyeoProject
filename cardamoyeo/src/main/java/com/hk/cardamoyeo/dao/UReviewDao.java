package com.hk.cardamoyeo.dao;

import java.util.ArrayList;

import com.hk.cardamoyeo.dto.ReviewDto;

public interface UReviewDao {
	public ArrayList<ReviewDto> rvlistDao(int page, int limit,String user_id);
	public Integer rvListCount();
	public void rvDelDao(int review_seq);
}

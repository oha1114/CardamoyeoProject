package com.hk.cardamoyeo.dao;

import java.util.ArrayList;

import com.hk.cardamoyeo.dto.RDto;

public interface UResDao {
	public ArrayList<RDto> resDao(int page, int limit, String user_id);
	public Integer resListCount();
}

package com.hk.cardamoyeo.dao;

import java.util.List;

import com.hk.cardamoyeo.dto.SDto;

public interface mdao {
	
	//public List<SDto> getAllList();
	public List<SDto> getAllList(String keyword);
}

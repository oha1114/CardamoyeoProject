package com.hk.cardamoyeo.service;

import java.util.List;

import com.hk.cardamoyeo.dto.SDto;

public interface MService {
	//public List<SDto> getAllList();
	public List<SDto> getAllList(String keyword);
}

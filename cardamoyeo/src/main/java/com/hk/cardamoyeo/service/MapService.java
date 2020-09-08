package com.hk.cardamoyeo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.MapDao;
import com.hk.cardamoyeo.dto.SDto;

@Service
public class MapService implements MService{
	@Autowired
	 private MapDao dao;

	/*@Override
	public List<SDto> getAllList() {
		return dao.getAllList();
	}*/
	
	@Override
	public List<SDto> getAllList(String keyword) {
		return dao.getAllList(keyword);
	}
}

package com.hk.cardamoyeo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.util.SConstant;

public class RDeleteService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String store_seq = request.getParameter("store_seq");
		String review_seq = request.getParameter("review_seq");
		
		SDao dao = SConstant.dao;
		dao.rvDel(store_seq,review_seq);


	}

}

package com.hk.cardamoyeo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.util.SConstant;

public class LikeNoService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String store_seq = request.getParameter("store_seq");
		String user_id = request.getParameter("user_id");
		
		SDao dao = SConstant.dao;
		dao.likeNo(store_seq,user_id );

	}

}

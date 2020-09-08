package com.hk.cardamoyeo.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;

import com.hk.cardamoyeo.util.SConstant;

public class PListService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//test
		//업체가 보는 예약내역, user_id /type로 변경 해주어야 함
		String res_seq = request.getParameter("res_seq");
		
		SDao dao = SConstant.dao;
		List<FDto> dto = dao.payList(res_seq);
		
		System.out.println(dto);
		model.addAttribute("list", dto);
		

	}

}

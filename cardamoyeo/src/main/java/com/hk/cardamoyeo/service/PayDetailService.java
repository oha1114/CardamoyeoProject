package com.hk.cardamoyeo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;

import com.hk.cardamoyeo.util.SConstant;

public class PayDetailService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String res_seq = request.getParameter("res_seq");
		String user_id = request.getParameter("user_id");
		
		SDao dao = SConstant.dao;
		List<FDto> dto = dao.resCon(res_seq, user_id);
		
		
		
		System.out.println("dtoSize:"+dto.size());
	
		
		model.addAttribute("res", dto);
		
	}

}

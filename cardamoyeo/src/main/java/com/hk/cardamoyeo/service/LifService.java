package com.hk.cardamoyeo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.RDto;
import com.hk.cardamoyeo.util.SConstant;

public class LifService implements SService {

	@Override
	public void execute(Model model) {
		
//		Map<String, Object> map = model.asMap();
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		
//		String store_seq =  request.getParameter("store_seq");
//		String user_id = (String)request.getAttribute("user_id");
//		
//		SDao dao = SConstant.dao;
//		List<LDto> dto = dao.likeIf(store_seq, user_id);
//		model.addAttribute("list", dto);
		

	}

}

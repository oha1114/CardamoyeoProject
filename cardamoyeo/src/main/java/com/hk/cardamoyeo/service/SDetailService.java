package com.hk.cardamoyeo.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;
import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.ReviewDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.util.SConstant;

public class SDetailService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String store_seq = request.getParameter("store_seq");
		String user_id = (String)request.getAttribute("user_id");
		
		SDao dao = SConstant.dao;
		List<FDto> dto = dao.writeView(store_seq);
		List<FDto> dto1 = dao.reviewView(store_seq);
		List<LDto> dto2 = dao.likeIf(store_seq, user_id);
		List<ReviewDto> dto3 = dao.totalS(store_seq);
		
		System.out.println("dtoSize:"+dto.size());
		
		
		model.addAttribute("store", dto);
		model.addAttribute("review", dto1);
		model.addAttribute("ke", dto2);
		model.addAttribute("total", dto3);
		
		
		
		
	}

}

package com.hk.cardamoyeo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.RDto;
import com.hk.cardamoyeo.dto.ReviewDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.util.SConstant;

public class RifService implements SService {

	@Override
	public void execute(Model model) {
		//결제한 유저만 리뷰를 작성 할 수 있도록 함.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String store_seq =  request.getParameter("store_seq");
		String user_id = (String)request.getAttribute("user_id");
		

		SDao dao = SConstant.dao;
		List<RDto> dto = dao.reviewIf(store_seq, user_id);
		model.addAttribute("list", dto);
		
		System.out.println("RifService >>>user_id : "+user_id);
		System.out.println("RifService dto: "+dto.size());
		
	}

}

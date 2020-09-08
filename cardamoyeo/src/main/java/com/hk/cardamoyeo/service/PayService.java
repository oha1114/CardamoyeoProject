package com.hk.cardamoyeo.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;

import com.hk.cardamoyeo.util.SConstant;

public class PayService implements SService {

	@Override
	public void execute(Model model) {
		

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		
		
		//select
		String store_seq = request.getParameter("store_seq");
		String user_id = request.getParameter("user_id");
//		String store_name = request.getParameter("store_name");
//		String one_time = request.getParameter("one_time");
//		String two_time = request.getParameter("two_time");
//		String one_day = request.getParameter("one_day");
//		String month_time = request.getParameter("month_time");
//		String store_money = request.getParameter("store_money"); 
		
		
		
	    SDao dao = SConstant.dao;
	    
	    List<FDto> dto = dao.resView(store_seq);
		model.addAttribute("store", dto);
		
		System.out.println("payService user_id : "+user_id);

		

		

	}

}

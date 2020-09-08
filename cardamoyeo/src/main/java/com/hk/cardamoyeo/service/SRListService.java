package com.hk.cardamoyeo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;


import com.hk.cardamoyeo.util.SConstant;

public class SRListService implements SService_1 {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		
		

		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;

		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest) map.get("request");
		
		String store_seq = request.getParameter("store_seq");
		
		String user_id = request.getParameter("user_id");
		
		System.out.println("sr service >>>> user_id :"+ user_id);
		System.out.println("sr service >>>> store_seq :"+ store_seq);
		
		SDao dao = SConstant.dao;
		List<FDto> dtos = dao.srlist(page, limit, user_id);
		
		
		Integer count = dao.srListCount();
		System.out.println(dtos);
		model.addAttribute("list", dtos);
		
		PageService pageService = new PageService();
		pageService.page(request, count, limit, limitPage, page, "sResList?");
	
		
		
		

	}

}

package com.hk.cardamoyeo.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.CDao;
import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.util.SConstant;

@Service
public class SListService implements SService_1  {
//	@Autowired
//	CDao dao;
	
	@Override
	public void execute( Model model, HttpServletRequest request) {
		

		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		

		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest) map.get("request");

		String user_id = request.getParameter("user_id");
		
		System.out.println("user_id: "+user_id);
		
		SDao dao = SConstant.dao;
		ArrayList<SDto> dtos = dao.list(page, limit, user_id);
		
		Integer count = dao.sListCount();
		System.out.println(dtos);
		model.addAttribute("list", dtos);
		
		PageService pageService = new PageService();
		pageService.page(request, count, limit, limitPage, page, "storeList?");


	}

	

}

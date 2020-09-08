package com.hk.cardamoyeo.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.UQnaDaoImpl;
import com.hk.cardamoyeo.dto.UQnaDto;
import com.hk.cardamoyeo.util.Constant;

public class UQnaService implements IService {


	@Override
	public void execute(Model model, HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10; // 페이지 안에 들어갈 개수
		int limitPage = 10; // 페이지번호
		
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest)map.get("request");
		String user_id = request.getParameter("user_id");
		UQnaDaoImpl dao = Constant.uqnadao;
		ArrayList<UQnaDto> dtos = dao.uQnalistDao(page, limit, user_id);
		Integer count = dao.qnaListCount();
		model.addAttribute("qnalist", dtos);
		
		PageService pageService = new PageService();
		pageService.page(request, count, limit, limitPage, page, "userQna?");
	}

}

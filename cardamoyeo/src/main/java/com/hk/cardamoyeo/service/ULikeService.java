package com.hk.cardamoyeo.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.ULikeDao;
import com.hk.cardamoyeo.dao.ULikeDaoImpl;
import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.util.Constant;

public class ULikeService implements IService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private ULikeDao dao;


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
		ULikeDaoImpl dao = Constant.ldao;
		ArrayList<LDto> dtos = dao.likeListDao(page, limit, user_id);
		Integer count = dao.likeListCount();
		model.addAttribute("ha", dtos);

		PageService pageService = new PageService();
		pageService.page(request, count, limit, limitPage, page, "userLike?");
		
	}

	

}

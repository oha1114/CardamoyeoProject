package com.hk.cardamoyeo.service;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;

import com.hk.cardamoyeo.dto.ReviewDto;
import com.hk.cardamoyeo.util.SConstant;

public class RWriteService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		String store_seq = request.getParameter("store_seq");
		String user_id =  request.getParameter("user_id");
		String[] store_star = request.getParameterValues("store_star");
		String review_content = request.getParameter("review_content");
		Timestamp review_date = new Timestamp(System.currentTimeMillis());
		
		System.out.println("user_id(service):"+user_id);
		
		SDao dao = SConstant.dao;
		dao.reviewWrite(new ReviewDto(0,Integer.parseInt(store_seq),user_id,store_star[store_star.length-1], review_content, review_date));
		
	}

}

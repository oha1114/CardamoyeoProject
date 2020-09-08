package com.hk.cardamoyeo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.UReviewDaoImpl;
import com.hk.cardamoyeo.util.Constant;

public class RvDeleteService implements IService {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest)map.get("request");
		int review_seq = Integer.parseInt(request.getParameter("review_seq"));
		UReviewDaoImpl dao = Constant.rvdao;
		dao.rvDelDao(review_seq);
	}

}

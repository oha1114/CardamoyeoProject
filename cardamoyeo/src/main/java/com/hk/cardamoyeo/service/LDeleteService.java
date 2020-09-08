package com.hk.cardamoyeo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.ULikeDaoImpl;
import com.hk.cardamoyeo.util.Constant;

public class LDeleteService implements IService{


	@Override
	public void execute(Model model, HttpServletRequest request) {
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest)map.get("request");
		int likeListSeq = Integer.parseInt(request.getParameter("like_list_seq"));
		ULikeDaoImpl dao = Constant.ldao;
		dao.deleteDao(likeListSeq);
	}
}

package com.hk.cardamoyeo.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.RDto;
import com.hk.cardamoyeo.dto.ReviewDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.util.SConstant;

public class LikeOkService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		 
		String store_seq = request.getParameter("store_seq");
		String user_id = request.getParameter("user_id");
		
		SDao dao = SConstant.dao;
		
		dao.likeOk(new LDto(0,user_id,Integer.parseInt(store_seq),null,null));
		
		System.out.println("LikeOkService store_seq : "+store_seq);
		System.out.println("LikeOkService user_id : "+user_id);
		

		
		
	}

}

package com.hk.cardamoyeo.service;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.util.SConstant;

public class PayOkService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
//		String user_id = request.getParameter("user_id");
//		String store_seq = request.getParameter("store_seq");
		String res_seq = request.getParameter("res_seq");
		Timestamp pay_date = new Timestamp(System.currentTimeMillis());	
		String res_success = request.getParameter("res_success");
		
		SDao dao = SConstant.dao;
		dao.resUpdate(res_seq, pay_date, res_success);
		
		System.out.println("payOk >>>>>>res_seq : "+res_seq);
		
		


	}

}

package com.hk.cardamoyeo.service;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.PDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.util.SConstant;

public class PayWriteService implements SService {

	@Override
	public void execute(Model model) {

		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String store_seq = request.getParameter("store_seq");		
		String user_id = request.getParameter("user_id");
		String car_num = request.getParameter("car_num");
		Timestamp res_date = new Timestamp(System.currentTimeMillis());
		String res_pay = request.getParameter("res_pay");
		String res_intime = request.getParameter("res_intime");
		String[] menu_type = request.getParameterValues("menu_type");
		
		System.out.println("PayWriteService, user_id   :  "+ user_id);
		
		System.out.println("store_seq :"+store_seq);
		System.out.println("car_num :"+car_num);
		System.out.println("res_pay :"+res_pay);
		System.out.println("res_intime :"+res_intime);
		System.out.println("menu_type :"+menu_type[0]);

		
		 SDao dao = SConstant.dao;
//		 int i = dao.resInsert(new PDto(0,Integer.parseInt(store_seq),user_id,car_num,null,res_date, res_pay, null,res_intime, menu_type[0]));
		 
		 
		 PDto dto = new PDto(0,Integer.parseInt(store_seq),user_id,car_num,null,res_date, res_pay, null,res_intime, menu_type[0]);
		 int i = dao.resInsert(dto);
		 
		 model.addAttribute("res_seq", i);
		 
		 System.out.println("PayWriteService >> i : "+ i);
	
	}
	


}
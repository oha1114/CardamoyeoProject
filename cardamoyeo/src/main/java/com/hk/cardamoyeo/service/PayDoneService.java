package com.hk.cardamoyeo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;
import com.hk.cardamoyeo.util.SConstant;

public class PayDoneService implements SService {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String res_seq = request.getParameter("res_seq");
		
		SDao dao = SConstant.dao;
		List<FDto> dto = dao.resList(res_seq);
		
		
		model.addAttribute("res", dto);
		
		System.out.println("dto:"+dto);
		
		System.out.println("paydon >>> res_seq : "+res_seq);
		

	}


}

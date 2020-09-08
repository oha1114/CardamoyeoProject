package com.hk.cardamoyeo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.LogDao;
import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.util.Constant;
import com.hk.cardamoyeo.util.SConstant;

public class OInfoServiceImpl implements IService {
	
	//마이페이지 - 회원정보 조회
	@Override
	public void execute(Model model, HttpServletRequest request) {
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest)map.get("request");
		
		String user_id = request.getParameter("user_id");
		System.out.println("user_id가지고오나? = " + user_id);
		
		SDao dao = SConstant.dao;
		List<LoginDto> dtos = dao.oinfoDao(user_id);
		model.addAttribute("udto", dtos.get(0));
	}

}

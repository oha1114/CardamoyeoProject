package com.hk.cardamoyeo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.util.Constant;

public class LoginService implements LogService {
	
	@Override
	public void execute(Model model, HttpServletRequest request) {
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest)map.get("request");
		String user_id = request.getParameter("user_id");
		LogDaoImpl dao = Constant.dao;
		dao.login(user_id);
	}

}

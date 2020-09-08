package com.hk.cardamoyeo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.util.Constant;

@Service
public class MemberDeleteService implements IService {

	@Override
	public void execute(Model model, HttpServletRequest request) {
		Map<String, Object> map = model.asMap();
		request = (HttpServletRequest)map.get("request");
		String user_id = request.getParameter("user_id");
		LogDaoImpl dao = Constant.dao;
		System.out.println("탈퇴 user_id 값 : " + user_id);
		dao.userDeleteDao(user_id);
	}

}

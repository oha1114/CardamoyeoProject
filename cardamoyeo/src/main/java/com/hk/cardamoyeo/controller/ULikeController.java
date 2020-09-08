package com.hk.cardamoyeo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.cardamoyeo.dao.ULikeDaoImpl;
import com.hk.cardamoyeo.service.IService;
import com.hk.cardamoyeo.service.LDeleteService;
import com.hk.cardamoyeo.service.ULikeService;
import com.hk.cardamoyeo.util.Constant;

@Controller
public class ULikeController {
	@Qualifier("i2")
	IService service;
	
	@Qualifier("i3")
	IService service1;
	
	@Autowired
	private ULikeDaoImpl ldao;
	
	@Autowired
	public void setDao(ULikeDaoImpl ldao) {
		Constant.ldao = ldao;
	}
	
	@RequestMapping("/userLike")
	public String list(Model model,HttpServletRequest request) throws Exception {
		System.out.println("관심등록 리스트 요청");
		model.addAttribute("request", request);
		service1 = new ULikeService();
		service1.execute(model, request);
		return "userLike";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		
		model.addAttribute("request", request);
		service = new LDeleteService();
		service.execute(model, request);
		
		return "redirect:userLike?user_id="+request.getParameter("user_id");
	}
	

}

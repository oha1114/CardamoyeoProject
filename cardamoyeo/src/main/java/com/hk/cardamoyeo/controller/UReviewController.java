package com.hk.cardamoyeo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.cardamoyeo.dao.UResDaoImpl;
import com.hk.cardamoyeo.dao.UReviewDaoImpl;
import com.hk.cardamoyeo.service.IService;
import com.hk.cardamoyeo.service.LDeleteService;
import com.hk.cardamoyeo.service.RvDeleteService;
import com.hk.cardamoyeo.service.ULikeService;
import com.hk.cardamoyeo.service.UReviewService;
import com.hk.cardamoyeo.util.Constant;

@Controller
public class UReviewController {
	@Qualifier("i5")
	IService service;
	
	@Qualifier("i6")
	IService service1;
	
	@Autowired
	private UReviewDaoImpl rvdao;
	
	@Autowired
	public void setDao(UReviewDaoImpl rvdao) {
		Constant.rvdao = rvdao;
	}
	
	@RequestMapping("/userReview")
	public String list(Model model,HttpServletRequest request) throws Exception {
		System.out.println("리뷰 리스트 요청");
		model.addAttribute("request", request);
		service = new UReviewService();
		service.execute(model,request); 
		
		return "userReview";
	}
	
	@RequestMapping("/reviewDel")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("리뷰 delete()");
		
		model.addAttribute("request", request);
		service1 = new RvDeleteService();
		service1.execute(model,request);
		
		return "redirect:userReview?user_id="+request.getParameter("user_id");
	}
}

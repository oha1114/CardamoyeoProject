package com.hk.cardamoyeo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.cardamoyeo.dao.UResDaoImpl;
import com.hk.cardamoyeo.service.IService;
import com.hk.cardamoyeo.service.UResListService;
import com.hk.cardamoyeo.util.Constant;

@Controller
public class UResController {
	@Qualifier("i4")
	IService service;
	
	@Autowired
	private UResDaoImpl rdao;
	
	@Autowired
	public void setDao(UResDaoImpl rdao) {
		Constant.rdao = rdao;
	}
	
	@RequestMapping("/userResList")
	public String resList(Model model,HttpServletRequest request) throws Exception {
		System.out.println("결제내역 리스트 요청");
		model.addAttribute("request", request);
		service = new UResListService();
		service.execute(model,request); 
		
		return "userResList";
	}
	

}

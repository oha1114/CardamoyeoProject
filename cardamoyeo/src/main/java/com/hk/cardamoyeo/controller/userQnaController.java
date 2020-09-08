package com.hk.cardamoyeo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hk.cardamoyeo.dao.UQnaDaoImpl;
import com.hk.cardamoyeo.dao.UReviewDaoImpl;
import com.hk.cardamoyeo.service.IService;
import com.hk.cardamoyeo.service.UQnaService;
import com.hk.cardamoyeo.service.UReviewService;
import com.hk.cardamoyeo.util.Constant;

@Controller
public class userQnaController {
	
	@Qualifier("i7")
	IService service;
	
	@Autowired
	private UQnaDaoImpl uqnadao;
	
	@Autowired
	public void setDao(UQnaDaoImpl uqnadao) {
		Constant.uqnadao = uqnadao;
	}
	
	@RequestMapping("/userQna")
	public String list(Model model,HttpServletRequest request) throws Exception {
		System.out.println("Q&A 리스트 요청");
		model.addAttribute("request", request);
		service = new UQnaService();
		service.execute(model,request); 
		
		return "userQna";
	}
	
	@RequestMapping("/user_qna_pass")
	public String user_qna_pass() throws Exception {
		
		return "user_qna_pass";
	}
}

package com.hk.cardamoyeo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.cardamoyeo.service.UserMailSendService;
import com.hk.cardamoyeo.service.UserSearchService;

@Controller
public class userFindController {
	@Autowired
	private UserSearchService findService;
	@Autowired
	private UserMailSendService mailsender;
	
	// 아이디 찾기
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("user_name") String user_name, 
			@RequestParam("user_email") String user_email) {
			
		String result = findService.get_searchId(user_name, user_email);

		return result;
	}
		
	// 비밀번호 찾기
	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String passwordSearch(@RequestParam("user_id")String user_id,
			@RequestParam("user_email")String user_email,
		HttpServletRequest request) {

		mailsender.mailSendWithPassword(user_id, user_email, request);
			
		//return "redirect:login";
		return "login";
	}
}

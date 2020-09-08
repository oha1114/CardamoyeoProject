package com.hk.cardamoyeo.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.security.naver.NaverLoginBO;
import com.hk.cardamoyeo.service.LogJoinService1;
import com.hk.cardamoyeo.service.LogService;
import com.hk.cardamoyeo.service.LogService1;
import com.hk.cardamoyeo.service.UserMailSendService;
import com.hk.cardamoyeo.service.UserService;
import com.hk.cardamoyeo.util.Constant;


@Controller
public class logController {
	private LogDaoImpl dao;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;	
	private String apiResult = null;
	
	@Autowired  //bean주입
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private LogService Lservice;
	
	@Autowired
	private LogService1 Lservice1;
	
	@Autowired
	private UserService service;
	
	@Autowired
	public void setDao(LogDaoImpl dao) {
		this.dao = dao;
		Constant.dao = this.dao;
	}
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private UserMailSendService mailsender;

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(	
		@RequestParam(value = "error", required = false) String error,

		@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		System.out.println("error" + error);
		System.out.println("logout" + logout);

		if (error != null) {

			model.addObject("error", "Invalid username and password!");

		}

		if (logout != null) {

			model.addObject("msg", "You've been logged out successfully.");

		}

		model.setViewName("login");

		return model;	
		
	}
	
	@RequestMapping(value = "/login_owner", method = RequestMethod.GET)
	public ModelAndView login_owner(	
		@RequestParam(value = "error", required = false) String error,

		@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		System.out.println("error" + error);
		System.out.println("logout" + logout);

		if (error != null) {

			model.addObject("error", "Invalid username and password!");

		}

		if (logout != null) {

			model.addObject("msg", "You've been logged out successfully.");

		}

		model.setViewName("login_owner");

		return model;	
		
	}
	

	@RequestMapping("index")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model, Principal principal) {
		String user_id = principal.getName();
		model.addAttribute("user_id", user_id);
		return "index";
	}
	
	
	@RequestMapping("logout")
	public String logout() {
		return "logout";
	}

	
	@RequestMapping("register")
	public String register() {
		return "register";
	}
	//아이디 중복체크
	@RequestMapping(value = "/idCheck",method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
			
		String user_id = request.getParameter("user_id");
		int result=service.idCheck(user_id);
		return Integer.toString(result);
	}
	
	//이메일 중복체크
	@RequestMapping(value = "/emailCheck",method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String emailCheck(HttpServletRequest request) {
				
		String user_email = request.getParameter("user_email");
		int result=service.emailCheck(user_email);
		return Integer.toString(result);
	}
	
	@RequestMapping("ownerRegister")
	public String ownerRegister(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		response.setContentType("text/plain charset=UTF-8");
		response.setHeader("Cache-Control", "no-chache");
		
		return "ownerRegister";
	}
	
	@RequestMapping("userRegister")
	public String userRegister(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) {
		response.setContentType("text/plain charset=UTF-8");
		response.setHeader("Cache-Control", "no-chache");
		
		return "userRegister"; 
	}


	@RequestMapping("join")
	public String join(UserDto userDto, HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("join");

		Lservice.execute(model, request);
		String result = (String)request.getAttribute("result");
		response.setContentType("text/plain; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");

		if(result.equals("join-success")) {
			// 인증 메일 보내기 메서드
			mailsender.mailSendWithUserKey(userDto.getUser_email(), userDto.getUser_id(), request);
			return "index";
		}
		else 
			return "login";
		
	}
	
	@RequestMapping("join1")
	public String join1(UserDto userDto, HttpServletResponse response, Model model, MultipartHttpServletRequest multi) {
		System.out.println("join1");
		
		//model.addAttribute("request", request);
		//Lservice1 = new LogJoinService1();//처리하기위한비즈니스 클래스
		
		Lservice1.execute(model, multi);
		String result = (String)multi.getAttribute("result");
		response.setContentType("text/plain; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		

		if(result.equals("join-success")) {
			// 인증 메일 보내기 메서드
			mailsender.mailSendWithUserKey(userDto.getUser_email(), userDto.getUser_id(), multi);
			return "index";
		}
		else 
			return "login";
		
	}
	
	// e-mail 인증 컨트롤러
	@RequestMapping(value = "/user/key_alter", method = RequestMethod.GET)
	public String key_alterConfirm(@RequestParam("user_id") String user_Id, @RequestParam("join_ok") String key) {
		mailsender.alter_userKey_service(user_Id, key); // mailsender의 경우 @Autowired
		return "regSuccess";
	}
	
	@RequestMapping("userFindView")
	public String userFindView() {
		return "userFindView";
	}
	
	@RequestMapping("callback")
	public String callback() {
		return "callback";
	}

	//네이버 로그인 성공시 callback호출 메소드		
		@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
				throws IOException {
			System.out.println("여기는  callback");
			OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	       //로그인 사용자 정보를 읽어온다.
		    apiResult = naverLoginBO.getUserProfile(oauthToken);
			model.addAttribute("result", apiResult);
	                
			return "index_naver";
		}
		
		@RequestMapping(value = "nlogin", method = { RequestMethod.GET, RequestMethod.POST })
		public void nlogin(Model model, HttpSession session,HttpServletResponse response) throws IOException {
			// 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);		
			//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버" + naverAuthUrl);
			
			//네이버 url
			//model.addAttribute("url", naverAuthUrl);

			// 생성한 인증 URL을 View로 전달
			response.sendRedirect(naverAuthUrl);
			//return "redirect:naverAuthUrl";
		}
}

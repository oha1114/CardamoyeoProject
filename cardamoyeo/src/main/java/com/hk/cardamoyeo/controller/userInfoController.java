package com.hk.cardamoyeo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.service.IService;
import com.hk.cardamoyeo.service.MemberDeleteService;
import com.hk.cardamoyeo.service.UInfoServiceImpl;
import com.hk.cardamoyeo.service.UserAuthService;
import com.hk.cardamoyeo.service.UserService;
import com.hk.cardamoyeo.service.UserServiceImpl;

@Controller
public class userInfoController {
	@Qualifier("u1")
	UserService service;
	
	@Qualifier("i1")
	IService Iservice;
	
	@Qualifier("i8")
	IService service2;
	
	@Autowired
	UserAuthService userService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	UserService userServiceImpl;
	
	@RequestMapping("userMypage")
	public String userMypage() {
		return "userMypage";
	}
	
	@RequestMapping(value = "/userInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String userInfo(Model model, Authentication auth, HttpServletRequest request, UserDto dto) {
		//LoginDto ldto = (LoginDto)auth.getPrincipal();
		//model.addAttribute("ldto", ldto);
		System.out.println("유저 정보 요청");
		model.addAttribute("request", dto);
		model.addAttribute("request", request);
		Iservice = new UInfoServiceImpl();
		Iservice.execute(model,request); 
		
		return "userInfo";
	}

	@RequestMapping(value = "/updatemyinfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String updatemyinfo(HttpServletRequest request, Model model, Authentication auth, UserDto dto) {
		System.out.println("updatemyinfo()");
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		request.setAttribute("dto", dto);
		model.addAttribute("request", ldto.getUser_id());
		model.addAttribute("request", request);
		System.out.println("dto : " + dto);
		service = new UserServiceImpl();
		service.execute(model);
		
		
		return "redirect:userInfo?user_id="+request.getParameter("user_id");
		//return "redirect:userInfo";
	}
	
	
	@RequestMapping("userConfirm")
	public String userConfirm() {
		return "userConfirm";
	}
	
	@RequestMapping("userDel")
	public String userDel() {
		return "userDel";
	}

	// 비밀번호 체크
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	@ResponseBody
	public int passChk(UserDto dto,Authentication authentication) throws Exception {
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; //유저가 입력한 정보를 이이디비번으으로만든다.(로그인한 유저아이디비번정보를담는다)
		 System.out.println("CustomAuthenticationProvider" + (LoginDto)authentication.getPrincipal());
		 System.out.println("authToken:"+authToken.getName()+","+dto.getUser_pass());
		 
		//LoginDto userInfo = (LoginDto) userService.loadUserByUsername(authToken.getName());
       //System.out.println("userInfo:"+userInfo);
       /*
       if (userInfo == null) {
         throw new UsernameNotFoundException(authToken.getName());
       }
       */
       LoginDto ldto = (LoginDto)authentication.getPrincipal();
       //String rawPassword = dto.getUser_pass();
       
       System.out.println("입력한 패스워드 : " + dto.getUser_pass());
       System.out.println("디비 패스워드 : " + ldto.getUser_pass());
       
       //String encpass = passwordEncoder.encode(dto.getUser_pass());
       //System.out.println("encpass:" + encpass);
       
       System.out.println(passwordEncoder.matches(dto.getUser_pass(), ldto.getUser_pass()));
       if (!passwordEncoder.matches(dto.getUser_pass(),ldto.getUser_pass())) {
          System.out.println("패스워드 틀림");
          int result = 0;
          return result;
         //throw new BadCredentialsException("not matching username or password");
       }
       else {
       	int result = 1;
       	return result;
       }
       /*
		service = new UserServiceImpl();
		int result = service.passChk(dto, authentication);
		return result;
		*/
	}
	
	//회원탈퇴
	@RequestMapping("/deleteMember")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("회원탈퇴!!");
		
		model.addAttribute("request", request);
		service2 = new MemberDeleteService();
		service2.execute(model,request);
		
		return "redirect:/logout";
	}

}

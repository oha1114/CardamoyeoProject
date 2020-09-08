package com.hk.cardamoyeo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.service.IService;
import com.hk.cardamoyeo.service.MGService;
import com.hk.cardamoyeo.service.UInfoServiceImpl;

@Controller
public class managerController {

	@Autowired
	private MGService mgService;
	
	@RequestMapping("/managerMypage")
	public String managerMypage() {
		return "managerMypage";
	}	
	
	@RequestMapping("/userManager")
	public Map<String, Object> userManager(Model model, @RequestParam(defaultValue="") String keyword) throws Exception {
		
		List<UserDto> list = mgService.getAllList(keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("keyword", keyword);

		return map;
	}
	
	@RequestMapping("/ownerManager")
	public Map<String, Object> ownerManager(Model model, @RequestParam(defaultValue="") String keyword) throws Exception {
		
		List<UserDto> list = mgService.getAllList2(keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("keyword", keyword);
		
		return map;
	}
	
	//회원을 삭제하는 메서드
	@RequestMapping("/UserDelete")
	public String delete(int user_num, Locale locale, Model model) {
		System.out.println(user_num + "삭제되나?");
		boolean isS = mgService.UserDelete(user_num);
		if(isS) {
				return "redirect:userManager";
		} else {
			model.addAttribute("msg", "삭제 실패");
			return "error";
		}
	}
		
	//회원을 삭제하는 메서드
	@RequestMapping("/OwnerDelete")
		public String delete2(int user_num, Locale locale, Model model) {
			System.out.println(user_num + "삭제되나?");
			boolean isS = mgService.UserDelete(user_num);
			if(isS) {
				return "redirect:ownerManager";
			} else {
				model.addAttribute("msg", "삭제 실패");
				return "error";
			}
	}
	
	
	@Qualifier("i1")
	IService Iservice;
	
	@RequestMapping(value = "/managerInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String userInfo(Model model, Authentication auth, HttpServletRequest request, UserDto dto) {
		//LoginDto ldto = (LoginDto)auth.getPrincipal();
		//model.addAttribute("ldto", ldto);
		System.out.println("유저 정보 요청");
		model.addAttribute("request", dto);
		model.addAttribute("request", request);
		Iservice = new UInfoServiceImpl();
		Iservice.execute(model,request); 
		
		return "managerInfo";
	}
	
}

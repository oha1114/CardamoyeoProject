package com.hk.cardamoyeo.controller;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;
import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.dto.PDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.service.IService;
import com.hk.cardamoyeo.service.LifService;
import com.hk.cardamoyeo.service.LikeNoService;
import com.hk.cardamoyeo.service.LikeOkService;
import com.hk.cardamoyeo.service.OInfoServiceImpl;
import com.hk.cardamoyeo.service.OwnerServiceImpl;
import com.hk.cardamoyeo.service.PListService;
import com.hk.cardamoyeo.service.PayDetailService;
import com.hk.cardamoyeo.service.PayDoneService;
import com.hk.cardamoyeo.service.PayOkService;
import com.hk.cardamoyeo.service.PayService;
import com.hk.cardamoyeo.service.PayWriteService;
import com.hk.cardamoyeo.service.RDeleteService;
import com.hk.cardamoyeo.service.RWriteService;
import com.hk.cardamoyeo.service.RifService;
import com.hk.cardamoyeo.service.SDeleteService;
import com.hk.cardamoyeo.service.SDetailService;
import com.hk.cardamoyeo.service.SListService;
import com.hk.cardamoyeo.service.SModifyService;
import com.hk.cardamoyeo.service.SRListService;
import com.hk.cardamoyeo.service.SService;
import com.hk.cardamoyeo.service.SService_1;
import com.hk.cardamoyeo.service.SService_2;
import com.hk.cardamoyeo.service.SWriteService;
import com.hk.cardamoyeo.service.UInfoServiceImpl;
import com.hk.cardamoyeo.service.UserServiceImpl;
import com.hk.cardamoyeo.util.SConstant;

@Controller
public class CController {
	
	
	SService sservice;
	SService sservice1;
	SService_1 sservice2;
	SService_2 sservice3;
	
	private SDao dao;
	
	@Autowired
	public void setDao(SDao dao) {
		SConstant.dao = dao;
	}
	
	@Qualifier("i9")
	IService Iservice;
	
	//qna
//	@RequestMapping("/ownerQna")
//	public String ownerQna(HttpServletRequest request, Model model) {
//		System.out.println("ownerQna()");
//		
//		
//		return "qna_list_owner";
//	}
//	
	//업체 회원정보
	@RequestMapping(value = "/ownerInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String userInfo(Model model, Authentication auth, HttpServletRequest request, UserDto dto) {
		//LoginDto ldto = (LoginDto)auth.getPrincipal();
		//model.addAttribute("ldto", ldto);
		System.out.println("유저 정보 요청");
		model.addAttribute("request", dto);
		model.addAttribute("request", request);
		Iservice = new OInfoServiceImpl();
		Iservice.execute(model,request); 
		
		return "ownerInfo";
	}
	//회원정보 수정
	@RequestMapping(value = "/updateownerInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String updatemyinfo(HttpServletRequest request, Model model, Authentication auth, UserDto dto) {
		System.out.println("updateownerInfo()");
		LoginDto ldto = (LoginDto)auth.getPrincipal();
		request.setAttribute("dto", dto);
		model.addAttribute("request", ldto.getUser_id());
		model.addAttribute("request", request);
		System.out.println("dto : " + dto);
		sservice = new OwnerServiceImpl();
		sservice.execute(model);
		
		
		return "redirect:ownerInfo?user_id="+request.getParameter("user_id");
		//return "redirect:userInfo";
	}
	//업체 마이페이지
	@RequestMapping("/ownerMypage")
	public String ownerMypage(HttpServletRequest request, Model model) {
		System.out.println("ownerMypage()");
		

		return "ownerMypage";
	}
	
	//결제내역
	@RequestMapping("/sResList")
	public String store_myPage_res(HttpServletRequest request, Model model) {
		System.out.println("store_myPage_res()");
		
		model.addAttribute("request", request);
		//업체 아이디 넘어가야함
		sservice2 = new SRListService();
		sservice2.execute(model, request);
		
		return "s_reservationList";
	}
	
	//매장 리스트
	@RequestMapping("/storeList")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("list()");
		model.addAttribute("request", request);
		
		sservice2 = new SListService();
		sservice2.execute(model, request);
		
		return "storeList";
	}
	//매장 등록
	@RequestMapping("/storeForm")
	public String write_view() {
		
		System.out.println("write_view");
		
		return "store_updateForm";
	}
	
	
	@RequestMapping("/storeForm_write")
	public String write(HttpServletRequest request, Model model, MultipartHttpServletRequest multi) {
		System.out.println("write()");
		
		model.addAttribute("request", request);
		sservice3 = new SWriteService();//처리하기위한비즈니스 클래스
		sservice3.execute(model, multi);
		
		//list목록으로 돌아와
		return "redirect:storeList?user_id="+request.getParameter("user_id");
	}
	
	//매장 상세
	@RequestMapping("/storeDetail")
	public String content_view(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("content_view");
		//authentication.getName(); - >로그인한 아이디
		request.setAttribute("user_id", authentication.getName());
		
		model.addAttribute("request", request);
		sservice = new SDetailService();
		sservice.execute(model);
		
		
		sservice1 = new RifService();
		sservice1.execute(model);
		
		
		
		System.out.println("authentication : "+authentication.getName());
		
		return "store_detail";
	}
	//매장 수정
	@RequestMapping("/storeModifyForm")
	public String modifyForm(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("modifyForm()");
		request.setAttribute("user_id", authentication.getName());
		model.addAttribute("request", request);
		sservice = new SDetailService();
		sservice.execute(model);
		
		return "store_modify";
	}
	
	@RequestMapping("/storeModify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("modify()");
		
		model.addAttribute("request", request);
		sservice = new SModifyService();
		sservice.execute(model);
		
		return "redirect:storeDetail?store_seq="+request.getParameter("store_seq");
	}
	
	
	@RequestMapping("/storeDelete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		
		model.addAttribute("request", request);
		sservice = new SDeleteService();
		sservice.execute(model);
		
		return "redirect:storeList?user_id="+request.getParameter("user_id");
	}
	
	
	@RequestMapping("/reviewform")
	public String reviewWrite(HttpServletRequest request, Model model) {
		System.out.println("reviewWrite()");
		
		model.addAttribute("request", request);
		sservice = new RWriteService();//처리하기위한비즈니스 클래스
		sservice.execute(model);
		
		return "redirect:storeDetail?store_seq="+request.getParameter("store_seq");
	}
	
	@RequestMapping("/reviewDel_1")
	public String reviewDel(HttpServletRequest request, Model model) {
		System.out.println("reviewDel()");
		
		model.addAttribute("request", request);
		sservice = new RDeleteService();
		sservice.execute(model);
		
		return "redirect:storeDetail?store_seq="+request.getParameter("store_seq");

	}
	//예약
	@RequestMapping("/resForm")
	public String resForm(HttpServletRequest request, Model model) {
		System.out.println("resForm()");
		
		model.addAttribute("request", request);
		sservice = new PayService();
		sservice.execute(model);
		
		return "reservationForm";
	}
	
	@RequestMapping("/resForm_1")
	public String resWrite(HttpServletRequest request, Model model) {
		System.out.println("resForm_1()");
		
		model.addAttribute("request", request);
		sservice = new PayWriteService();
		sservice.execute(model);
		
		//값을 가지고 오기 위해서 --insert한후 바로 페이지로 이동할 경우 (인서트할때 nextval한 시퀀스를 그다음 페이지에 currval로 가져오기 위함)
		//redirect는 다시 요청 하는 거기 때문에 getParameter로 해도 소용없다.
		//model에 담아서 다시 보내주어야 한다.
		Map<String, Object> map = model.asMap();	
		int res = (Integer) map.get("res_seq");
		
		//따로 안넣어줘도 됨 ;;ㅋㅋㅋ 선생님 이게 모죠?
		return "redirect:resPay";
	}
	
	@RequestMapping("/resPay")
	public String resDetail(HttpServletRequest request, Model model) {
		System.out.println("resPay()");
		
		model.addAttribute("request", request);
		sservice = new PayDetailService();
		sservice.execute(model);
		
		return "reservationConf";
	}
	
	@RequestMapping("/resPay_1")
	public String resDone(HttpServletRequest request, Model model) {
		System.out.println("resDone()");
		
		model.addAttribute("request", request);
		sservice = new PayDoneService();
		sservice.execute(model);
		
	
		return "kkpay"; 
	}
	
	@RequestMapping("/payOk")
	public String payOk(HttpServletRequest request, Model model) {
		System.out.println("payOk()");
		
		model.addAttribute("request", request);
		sservice = new PayOkService();
		sservice.execute(model);
		
		return "payOk";
	}
	
	@RequestMapping("/likeOk")
	@ResponseBody
	public String likeOk(HttpServletRequest request, Model model, Authentication authentication) {
		System.out.println("likeOk()");
		request.setAttribute("user_id", authentication.getName());
		model.addAttribute("request", request);
		sservice = new LikeOkService();
		sservice.execute(model);
		
		
		System.out.println("authentication : "+authentication.getName());
		return "fa-heart";
	}
	
	@RequestMapping("/likeNo")
	@ResponseBody
	public String likeNo(HttpServletRequest request, Model model) {
		System.out.println("likeNo()");
		model.addAttribute("request", request);
		sservice = new LikeNoService();
		sservice.execute(model);
		
		return "fa-heart-o";
	}
	
	
	
	
	
	
	
	
	
	

}

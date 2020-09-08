package com.hk.cardamoyeo;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.service.SListService;
import com.hk.cardamoyeo.service.SService;
import com.hk.cardamoyeo.util.SConstant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	SService sservice;

	
	private SDao dao;
	
	@Autowired
	public void setDao(SDao dao) {
		SConstant.dao = dao;
	}
	
//	@Autowired
//	//bean의 설정된 jdbctemplate객체 저장
//	public void setTemplate(JdbcTemplate template) {
//		this.template = template;
//		//util에 있는 Constant클래스 가지고온것을 위에 JdbcTemplte로 저장한 내template에 저장해줘
//		SConstant.template = this.template;
//		
//	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		/*
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		*/
		//잠깐 주석
		
		
		//return "likeanddislike";
		
		//return "store_updateForm";
		//return "store_detail";
		
		//return "reservationForm";
		//return "S_myPage";
		return "index";
		//return "redirect:storeList";
	}
	

	
	

}

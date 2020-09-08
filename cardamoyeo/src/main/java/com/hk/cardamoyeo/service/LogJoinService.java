package com.hk.cardamoyeo.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.util.Constant;

@Service
public class LogJoinService implements LogService {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 
	

	@Override
	public void execute(Model model, HttpServletRequest request) {
		int bNum = Integer.parseInt(request.getParameter("user_num"));
		String bId = request.getParameter("user_id");
		String bName = request.getParameter("user_name");
		String bNic = request.getParameter("user_nic");
		String bPass = request.getParameter("user_pass");
		String bPhone = request.getParameter("user_phone");
		String bEmail = request.getParameter("user_email");
		String bAddress = request.getParameter("user_address");	
		String bGender = request.getParameter("user_gender");
		//String bRegdate = req.getParameter("userRegdate");
		Timestamp bRegdate = new Timestamp(System.currentTimeMillis());
		
		/*
		SimpleDateFormat dt = 
				new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
		date = dt.parse(bRegdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp bRegdate1 = new Timestamp(date.getTime());
		*/
		
		String bRole = request.getParameter("user_role");
		String bOut = request.getParameter("user_out");
		String bOwnerOk = request.getParameter("owner_ok");
		String bBizNumber = request.getParameter("store_license_number");
		String bBizImage = request.getParameter("store_license_image");
		String bJoinOk = request.getParameter("join_ok");
		
		System.out.println(bNum);
		System.out.println(bId);
		System.out.println(bName);
		System.out.println(bNic);
		System.out.println(bPass);
		System.out.println(bPhone);
		System.out.println(bEmail);
		System.out.println(bAddress);
		System.out.println(bGender);
		System.out.println(bRegdate);
		System.out.println(bRole);
		System.out.println(bOut);
		System.out.println(bOwnerOk);
		System.out.println(bBizNumber);
		System.out.println(bBizImage);
		System.out.println(bJoinOk);
		
		
		String bPw_org = bPass;
		bPass = passwordEncoder.encode(bPw_org); 
		System.out.println(bPass + " size " + bPass.length());
		UserDto dto = new UserDto(bNum,bId,bName,bNic,bPass,bPhone,bEmail,bAddress,bGender,bRegdate,bRole,bOut,bOwnerOk,bBizNumber,bBizImage,bJoinOk); 
		
		LogDaoImpl dao = Constant.dao;
			
		String result = dao.join(dto);
		
		request.setAttribute("result", result);
		//model.addAttribute("result",result);

	}

}

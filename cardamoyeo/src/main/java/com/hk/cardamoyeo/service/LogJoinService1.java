package com.hk.cardamoyeo.service;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.util.Constant;

@Service
public class LogJoinService1 implements LogService1 {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 
	

	@Override
	public void execute(Model model, MultipartHttpServletRequest multi) {
		int bNum = Integer.parseInt(multi.getParameter("user_num"));
		String bId = multi.getParameter("user_id");
		String bName = multi.getParameter("user_name");
		String bNic = multi.getParameter("user_nic");
		String bPass = multi.getParameter("user_pass");
		String bPhone = multi.getParameter("user_phone");
		String bEmail = multi.getParameter("user_email");
		String bAddress = multi.getParameter("user_address");	
		String bGender = multi.getParameter("user_gender");
		Timestamp bRegdate = new Timestamp(System.currentTimeMillis());
		String bRole = multi.getParameter("user_role");
		String bOut = multi.getParameter("user_out");
		String bOwnerOk = multi.getParameter("owner_ok");
		String bBizNumber = multi.getParameter("store_license_number");
		//String bBizImage = request.getParameter("store_license_image");
		String bJoinOk = multi.getParameter("join_ok");
		
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
		//System.out.println(bBizImage);
		System.out.println(bJoinOk);
		
		
		String bPw_org = bPass;
		bPass = passwordEncoder.encode(bPw_org); 
		System.out.println(bPass + " size " + bPass.length());
		
		
		LogDaoImpl dao = Constant.dao;
			
		
		
		// 다중 파일 업로드
		List<UserDto> list = new ArrayList<UserDto>();
		//MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		List<MultipartFile> mf = multi.getFiles("file");

		for (MultipartFile mtf : mf) {
			String originFileName = mtf.getOriginalFilename();

			String path = multi.getSession().getServletContext().getRealPath("upload");

			String safeFile = path + "/" + originFileName;

			try {
				// file객체에 저장파일경로를 넣어서 생성함
				// transferTo를 사용해서 저장파일경로를 가진 file객체를
				// d일반파일 생성자는 파라매터로 파일의 경로를 넣어주므로 파일경로인 safeFile 을 사용해야 일반파일로 바뀜
				mtf.transferTo(new File(safeFile)); // MultipartFile객체를 일반 객체로 변환
			} catch (Exception e) {
				e.printStackTrace();
			}

			UserDto dto = new UserDto(bNum,bId,bName,bNic,bPass,bPhone,bEmail,bAddress,bGender,bRegdate,bRole,bOut,bOwnerOk,bBizNumber,originFileName,bJoinOk); 
			String result = dao.join1(dto);
			multi.setAttribute("result", result);
//					list.add(new FDto(0,0,originFileName,null));
			System.out.println(originFileName);
		}
				
		
		
		//model.addAttribute("result",result);

	}

}

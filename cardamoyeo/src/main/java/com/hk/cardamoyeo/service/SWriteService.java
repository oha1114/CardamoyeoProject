package com.hk.cardamoyeo.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;
import com.hk.cardamoyeo.dto.MDto;
import com.hk.cardamoyeo.dto.PDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.util.SConstant;

public class SWriteService implements SService_2 {

	@Override
	public void execute(Model model, MultipartHttpServletRequest multi) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		
		String user_id = multi.getParameter("user_id");
		String store_name = multi.getParameter("store_name");
		String store_space = multi.getParameter("store_space");
		String store_address = multi.getParameter("store_address");
		String store_latitude = multi.getParameter("store_latitude");
		String store_longitude = multi.getParameter("store_longitude");
		String store_content = multi.getParameter("store_content");
		String store_phone = multi.getParameter("store_phone");
		String store_bank = multi.getParameter("store_bank");
		String store_account = multi.getParameter("store_account");
		String store_time_open = multi.getParameter("store_time_open");
		String store_time_close = multi.getParameter("store_time_close");
		String store_license_number = multi.getParameter("store_license_number");

		System.out.println("store_name :" + store_name);
		System.out.println("store_space = " + store_space);
		System.out.println("store_license_number = " + store_license_number);
		
		
		//단일 파일 업로드
		List<SDto> list1 = new ArrayList<SDto>();	
		
		List<MultipartFile> mf1 = multi.getFiles("file");

		int i = 0;
		for (MultipartFile mtff : mf1) {
			String originFileName1 = mtff.getOriginalFilename();

			String path1 = multi.getSession().getServletContext().getRealPath("upload");

			String safeFile1 = path1 + "/" + originFileName1;

			try {
				// file객체에 저장파일경로를 넣어서 생성함
				// transferTo를 사용해서 저장파일경로를 가진 file객체를
				// d일반파일 생성자는 파라매터로 파일의 경로를 넣어주므로 파일경로인 safeFile 을 사용해야 일반파일로 바뀜
				mtff.transferTo(new File(safeFile1)); // MultipartFile객체를 일반 객체로 변환
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			

			
			SDao dao = SConstant.dao;
			SDto dto = new SDto(0,user_id,store_name, store_space,store_address, store_content ,store_phone ,store_bank,store_account,store_license_number, originFileName1,store_latitude, store_longitude,store_time_open,store_time_close); 
			i = dao.write(dto);
			System.out.println("i : "+i);
//			multi.setAttribute("result", i);
//					list.add(new FDto(0,0,originFileName,null));
			System.out.println("originFileName1 >>>> "+originFileName1);
		}
		
		
		
		
		
		

//		SDao dao = SConstant.dao;
//		int i = dao.write(user_id, store_name, store_space, store_address ,store_latitude, store_longitude,store_content, store_phone, store_bank, store_account,store_time_open, store_time_close, store_license_number);

		
		
		//다중 파일 업로드
		List<FDto> list = new ArrayList<FDto>();
		multi = (MultipartHttpServletRequest) request;
		List<MultipartFile> mf = multi.getFiles("store_image");
		
		for (MultipartFile mtf : mf) {
			String originFileName = mtf.getOriginalFilename();
			long fileSize = mtf.getSize();
//			System.out.println("originFileName : " +originFileName);
//			System.out.println("fileSize : " +fileSize);

			String path= request.getSession().getServletContext().getRealPath("upload");  

			String safeFile = path+"/"+originFileName;

//			System.out.println("safeFile :::::::"+safeFile);
//			System.out.println("path::::::"+path);

			try {
				// file객체에 저장파일경로를 넣어서 생성함
				// transferTo를 사용해서 저장파일경로를 가진 file객체를
				// d일반파일 생성자는 파라매터로 파일의 경로를 넣어주므로 파일경로인 safeFile 을 사용해야 일반파일로 바뀜
				mtf.transferTo(new File(safeFile)); // MultipartFile객체를 일반 객체로 변환
			} catch (Exception e) {
				e.printStackTrace();
			}
			SDao dao = SConstant.dao;
			dao.fileInsert(new FDto(i,0,originFileName,null));
		
			
//			list.add(new FDto(0,0,originFileName,null));
			System.out.println(originFileName);
		}
		
		
		
		//주차권 메뉴
		String one_time = multi.getParameter("one_time");
		String two_time = multi.getParameter("two_time");
		String one_day = multi.getParameter("one_day");
		String month_time = multi.getParameter("month_time");
		String store_money = multi.getParameter("store_money");
		SDao dao = SConstant.dao;
		dao.writeMenu(new MDto(i,0, one_time, two_time, one_day,month_time, store_money));
		
	
	}

}

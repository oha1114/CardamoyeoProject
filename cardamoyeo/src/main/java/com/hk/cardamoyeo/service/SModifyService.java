package com.hk.cardamoyeo.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.FDto;
import com.hk.cardamoyeo.dto.MDto;
import com.hk.cardamoyeo.dto.SDto;
import com.hk.cardamoyeo.util.SConstant;

public class SModifyService implements SService {

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String store_seq = request.getParameter("store_seq");
		String store_name = request.getParameter("store_name");
		String store_space = request.getParameter("store_space");
		String store_address = request.getParameter("store_address");
		String store_latitude = request.getParameter("store_latitude");
		String store_longitude = request.getParameter("store_longitude");
		String store_content = request.getParameter("store_content");
		String store_phone = request.getParameter("store_phone");
		String store_time_open = request.getParameter("store_time_open");
		String store_time_close = request.getParameter("store_time_close");
		String[] store_image_seq = request.getParameterValues("store_image_seq");
		String menu_num = request.getParameter("menu_num");
		String one_time = request.getParameter("one_time");
		String two_time = request.getParameter("two_time");
		String one_day = request.getParameter("one_day");
		String month_time = request.getParameter("month_time");
		String store_money = request.getParameter("store_money");
		

		System.out.println("store_name :" + store_name);
		System.out.println("store_space = " + store_space);

		SDao dao = SConstant.dao;
		dao.modify(store_seq, store_name, store_space, store_address, store_content, store_phone,
				store_time_open, store_time_close);

		// 다중 파일 up
		List<FDto> list = new ArrayList<FDto>();
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		List<MultipartFile> mf = multi.getFiles("store_image");
		System.out.println("mf:"+mf.get(0).getOriginalFilename());
 
		// 파일이 전송되었을 때만 파일정보 저장 -- 파일이 있다면 -- update
		if (mf.get(0).getSize() > 0) {
			int i =0;
			
			for (MultipartFile mtf : mf) {
				
				String originFileName = mtf.getOriginalFilename();
				long fileSize = mtf.getSize();
				System.out.println("originFileName : " + originFileName);
				System.out.println("fileSize : " + fileSize);

				String path = request.getSession().getServletContext().getRealPath("upload");

				String safeFile = path + "/" + originFileName;

				System.out.println("safeFile :::::::" + safeFile);
				System.out.println("path::::::" + path);

				try {
					// file객체에 저장파일경로를 넣어서 생성함
					// transferTo를 사용해서 저장파일경로를 가진 file객체를
					// d일반파일 생성자는 파라매터로 파일의 경로를 넣어주므로 파일경로인 safeFile 을 사용해야 일반파일로 바뀜
					mtf.transferTo(new File(safeFile)); // MultipartFile객체를 일반 객체로 변환
				} catch (Exception e) {
					e.printStackTrace();
				}
				 dao.fileUpdate(new FDto(0, Integer.parseInt(store_image_seq[i++]), originFileName, null));
			}
			
			System.out.println("store_image_seq = "+store_image_seq[0]);
			
		}
		
	
		
		//주차권 수정 하기
		dao.menuUpdate(new MDto(0,Integer.parseInt(menu_num), one_time, two_time,one_day,month_time,store_money));
		

	}

}

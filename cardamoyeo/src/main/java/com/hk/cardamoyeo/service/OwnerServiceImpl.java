package com.hk.cardamoyeo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.dao.SDao;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.util.Constant;
import com.hk.cardamoyeo.util.SConstant;

public class OwnerServiceImpl implements SService {

	@Override
	public void execute(Model model) {
	
			Map<String, Object> map = model.asMap();
			HttpServletRequest request =  (HttpServletRequest)map.get("request");
			
			UserDto dto = (UserDto)request.getAttribute("dto");
			SDao dao = SConstant.dao;
			dao.oupdateInfo(dto);	
			
		}

	}



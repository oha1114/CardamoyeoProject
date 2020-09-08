package com.hk.cardamoyeo.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.dao.UserDao;
import com.hk.cardamoyeo.dao.UserDaoImpl;
import com.hk.cardamoyeo.dao.UserDaoInterface;
import com.hk.cardamoyeo.dto.UserDto;
import com.hk.cardamoyeo.util.Constant;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	LogDaoImpl dao;
	
	
	private UserDaoInterface userDao;
	
	@Autowired
	UserDao udao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 
	
	@Override
	public int idCheck(String user_id) {
		int result = dao.idCheck(user_id);
		return result;
	}

	@Override
	public int emailCheck(String user_email) {
		int result = dao.emailCheck(user_email);
		return result;
	}
	
	//회원정보 수정
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request =  (HttpServletRequest)map.get("request");
		UserDto dto = (UserDto)request.getAttribute("dto");
		LogDaoImpl dao = Constant.dao;
		dao.updateInfo(dto);	
		
	}


	//비밀번호 확인
	@Override
	public int passChk(UserDto dto) throws Exception {
		udao = new UserDaoImpl();
		int result = udao.passChk(dto);
		return result;
	}



	

}

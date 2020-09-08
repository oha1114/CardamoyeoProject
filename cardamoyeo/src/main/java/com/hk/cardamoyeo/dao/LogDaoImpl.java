package com.hk.cardamoyeo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.dto.UserDto;

@Repository
public class LogDaoImpl implements LogDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 
	
	@Override
	public LoginDto login(String bId) {
		LoginDto ud = sqlSession.selectOne("userMapper.login", bId);
		return ud;
	}


	@Override
	public String join(UserDto dto) {
		int result;
		try {
			result = sqlSession.insert("userMapper.join", dto);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "join-failed";
		}
		
		System.out.println(result);
		if(result > 0) 
			return "join-success";
		else
			return "join-failed";
	}

	@Override
	public String join1(UserDto dto) {
		int result;
		try {
			System.out.println("dto는 : " + dto);
			result = sqlSession.insert("userMapper.join1", dto);
			System.out.println("result는 : " + result);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "join-failed";
		}
		
		System.out.println(result);
		if(result > 0)  
			return "join-success";
		else
			return "join-failed";
	}

	@Override
	public int idCheck(String user_id) {
		System.out.println("===> 아이디 중복확인");
		int result = sqlSession.selectOne("userMapper.idCheck",user_id);
		return result;
	}

	@Override
	public int emailCheck(String user_email) {
		System.out.println("===> 이메일 중복확인");
		int result = sqlSession.selectOne("userMapper.emailCheck",user_email);
		return result;
	}


	public void updateInfo(UserDto dto) {		
		sqlSession.update("userMapper.updateInfo", dto);
		
	}

    //회원탈퇴
	@Override
	public void userDeleteDao(String user_id) {
		System.out.println("유저아이디 : " + user_id);
		sqlSession.delete("userMapper.userDelDao", user_id);
	}

	//회원정보 조회
	@Override
	public List<LoginDto> infoDao(String user_id) {
		System.out.println("user_id 값 : " + user_id);
		List<LoginDto> result = sqlSession.selectList("userMapper.infoDao",user_id);
		return result;
	}


	//비밀번호 체크
	@Override
	public int passChk(UserDto dto) throws Exception {
		System.out.println("세션 : " + sqlSession);
		int result = sqlSession.selectOne("userMapper.passChk", dto);
		//sqlSession.selectOne("userMapper.passChk", dto);
		return result;
	}



	
}

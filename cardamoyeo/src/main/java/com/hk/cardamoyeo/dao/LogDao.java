package com.hk.cardamoyeo.dao;

import java.util.ArrayList;
import java.util.List;

import com.hk.cardamoyeo.dto.LDto;
import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.dto.UserDto;

public interface LogDao {
	
	//로그인
	public LoginDto login(String bId);
	//사용자회원가입
	public String join(UserDto dto);
	//업체회원가입
	public String join1(UserDto dto);
	//아이디중복확인
	public int idCheck(String user_id);
	//이메일중복확인
	public int emailCheck(String user_email);
	//정보수정
	public void updateInfo(UserDto dto);
	//회원탈퇴
	public void userDeleteDao(String user_id);
	
	//비밀번호 체크
	public int passChk(UserDto dto) throws Exception;
		
	//회원정보
	public List<LoginDto> infoDao(String user_id);
	
}

package com.hk.cardamoyeo.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.hk.cardamoyeo.dto.UserDto;

@Service
public interface UserService {
	//아이디 체크
	public int idCheck(String user_id);
	//이메일 체크
	public int emailCheck(String user_email);

	//정보수정
	public void execute(Model model);

	
	//비밀번호 확인
	public int passChk(UserDto dto) throws Exception;
	//public int passChk(String user_id, String user_pass);
}

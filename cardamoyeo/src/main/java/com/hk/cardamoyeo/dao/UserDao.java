package com.hk.cardamoyeo.dao;

import com.hk.cardamoyeo.dto.UserDto;

public interface UserDao {
	//비밀번호 체크
	public int passChk(UserDto dto) throws Exception;

}

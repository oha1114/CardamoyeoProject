package com.hk.cardamoyeo.dao;

import org.apache.ibatis.annotations.Param;

import com.hk.cardamoyeo.dto.UserDto;

public interface UserDaoInterface {
	int GetKey(String user_id, String join_ok);
	int alter_userKey(String user_id, String key);
	String findId(@Param("user_name")String user_name, @Param("user_email")String user_email); // 유저 ID 찾기
	int findPassword(String user_id, String user_email, String key); // 회원 임시 비밀번호 변경 메서드
	UserDto userInfo(String user_id); //회원 정보
	//String confirm(@Param("user_id")String user_id, @Param("user_pass")String user_pass); //비밀번호 확인
}

package com.hk.cardamoyeo.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.cardamoyeo.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserDaoImpl() {
		
	}
	
	//비밀번호 체크
	@Override
	public int passChk(UserDto dto) throws Exception {
		int result = sqlSession.selectOne("userMapper.passChk", dto);
		//sqlSession.selectOne("userMapper.passChk", dto);
		return result;
	}


}

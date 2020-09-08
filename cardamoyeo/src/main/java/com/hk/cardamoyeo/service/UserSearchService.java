package com.hk.cardamoyeo.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.UserDaoInterface;

@Service
public class UserSearchService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private UserDaoInterface userDao;

	//아이디찾기
	public String get_searchId(String user_name, String user_email) {
		userDao = sqlSession.getMapper(UserDaoInterface.class);
				
		String result = "";
				
		try {
			result = userDao.findId(user_name, user_email);
		}catch (Exception e) {
			e.printStackTrace();
		}
				
		return result;
	}

	
}

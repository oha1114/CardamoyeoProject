package com.hk.cardamoyeo.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.LogDaoImpl;
import com.hk.cardamoyeo.util.Constant;

@Service
public class UserAuthService implements UserDetailsService{
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		LogDaoImpl dao = Constant.dao;	
		return dao.login(username);
	}
	
}

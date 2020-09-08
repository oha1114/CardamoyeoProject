package com.hk.cardamoyeo.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.hk.cardamoyeo.dto.LoginDto;
import com.hk.cardamoyeo.service.UserAuthService;

public class UserAuthProvider extends DaoAuthenticationProvider{
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	UserAuthService userService;

	@Override
	   public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		System.out.println("provider 호출");
		String userid = (String)authentication.getPrincipal();
		//String password = (String)authentication.getCredentials();
		System.out.println("userid: "+ userid);
		
		LoginDto dto = (LoginDto) getUserDetailsService().loadUserByUsername(userid);
		
		if(dto == null) {
			throw new UsernameNotFoundException(userid);
		}
		
		//PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		//String password2 = passwordEncoder.encode(password);
		//System.out.println("인코딩 패스워드" + password2);
		//System.out.println("디비 패스워드" + dto.getPassword());
		
		/*
		if(!matchPassword(password, dto.getPassword())) {
			throw new BadCredentialsException(userid);
		}
		*/
		
		/*
		if(!passwordEncoder.matches(password, dto.getPassword())) {
			throw new BadCredentialsException(userid);
		}
		*/
		
		String pw = dto.getPassword();
		
		if(!dto.isEnabled()) {
			throw new DisabledException(userid);
		}
		
		//@SuppressWarnings("unchecked")
		List<GrantedAuthority> roles = (List<GrantedAuthority>) dto.getAuthorities();
		UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(dto, pw, roles);
		System.out.println(dto);
		return auth;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// 스프링 Security가 요구하는 UsernamePasswordAuthenticationToken 타입이 맞는지 확인
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
		//return true;
	}


}

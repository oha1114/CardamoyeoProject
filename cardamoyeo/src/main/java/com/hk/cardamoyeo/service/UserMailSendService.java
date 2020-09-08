package com.hk.cardamoyeo.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hk.cardamoyeo.dao.UserDaoInterface;
import com.hk.cardamoyeo.dto.UserDto;

@Service
public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserDaoInterface userDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 
	
	// 이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}

		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}

		// 회원가입 발송 이메일(인증키 발송)
		public void mailSendWithUserKey(String user_email, String user_id, HttpServletRequest request) {
			
			String key = getKey(false, 20);
			userDao = sqlSession.getMapper(UserDaoInterface.class);
			userDao.GetKey(user_id, key); 
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 Cardamoyeo 입니다!</h2><br><br>" 
					+ "<h3>" + user_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='https://localhost:8443" + request.getContextPath() + "/user/key_alter?user_id="+ user_id +"&join_ok="+key+"'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[본인인증] Cardamoyeo : " + user_id + "님의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(user_email));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}

		}
		
		// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
		public int alter_userKey_service(String user_id, String key) {
			int resultCnt = 0;
					
			userDao = sqlSession.getMapper(UserDaoInterface.class);
			resultCnt = userDao.alter_userKey(user_id, key);
					
			return resultCnt;
		}
		
		// 패스워드 찾기 이메일 발송
		public void mailSendWithPassword(String user_id, String user_email, HttpServletRequest request) {
			System.out.println("임시 비밀번호 발급 단계");
			// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
			String key = getKey(false, 6);
			userDao = sqlSession.getMapper(UserDaoInterface.class);
							
			// 회원 이름 꺼내는 코드
			UserDto dto = userDao.userInfo(user_id);
			String name = dto.getUser_id();
									
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
									+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
									+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
									+ "<h3><a href='https://localhost:8443/cardamoyeo/'>Cardamoyeo 홈페이지 바로가기</a></h3><br><br>"
									+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[Cardamoyeo] 임시 비밀번호가 발급되었습니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(user_email));
				mailSender.send(mail);
			} catch (MessagingException e) { 
				e.printStackTrace();
			}
			// 비밀번호 암호화해주는 메서드
			key = passwordEncoder.encode(key);
			// 데이터 베이스 값은 암호한 값으로 저장시킨다.
			userDao.findPassword(user_id, user_email, key);
							
		}
}

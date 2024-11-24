package com.eats.email.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	//랜덤 6자리 인증코드 생성
	public String makeCode() {
		Random r = new Random();
		return String.format("%06d", r.nextInt(1000000));
	}
	
	//코드 전송 메소드
	public void sendCode(String to, String code) {
		//System.out.println("sendCode 호출");
		SimpleMailMessage msg=new SimpleMailMessage();
		
		msg.setTo(to);
		msg.setSubject("EATS에서 발송한 인증번호입니다.");
		msg.setText("인증번호는 "+code+"입니다.");
		
		mailSender.send(msg);
	}
	
	//ex)받는 사람 메일주소, 메일 제목, 메일 내용을 모두 인자로 받는 메일 전송 메소드
	public void sendEmail(String to, String subject, String content) {
		SimpleMailMessage msg=new SimpleMailMessage();
		
		msg.setTo(to);
		msg.setSubject(subject);
		msg.setText(content);
		
		mailSender.send(msg);
	}

}

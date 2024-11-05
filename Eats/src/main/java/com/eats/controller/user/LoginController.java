package com.eats.controller.user;

import java.time.LocalDateTime;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.email.service.EmailService;
import com.eats.user.service.UserLoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class LoginController {
	
	@Autowired
	private UserLoginService service;
	
	@Autowired
	private EmailService emailService;
	
	@GetMapping("/userLogin")
	public String goLogin() {
		
		return "user/login/userLogin";
	}
	
	@PostMapping("/userLogin")
	public ModelAndView submitLogin(
			@RequestParam(value="userId", required = true)String userId,
			@RequestParam(value="userPwd", required = true)String userPwd,
			@RequestParam(value="saveId", required = false)String saveId,
			HttpSession session, 
			HttpServletResponse resp) {
		
		boolean result=service.loginCheck(userId, userPwd);
		
		ModelAndView mv=null;
		
		if(result) {
			//로그인성공
			mv=new ModelAndView("redirect:/");
			Map<String, Object> map=service.getUserInfo(userId);

			session.setAttribute("user_idx", map.get("USER_IDX"));
			session.setAttribute("user_nickname", map.get("USER_NICKNAME"));
			
			Cookie ck=new Cookie("saveId", userId);
			if(saveId==null || saveId=="") {
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}else {
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}
						
		}else {
			//로그인실패
			mv=new ModelAndView();
			
			mv.addObject("msg", "아이디 또는 비밀번호를 확인해주세요");
			mv.setViewName("user/login/loginMsg");
		}
		
		return mv;
	}
	
	@GetMapping("/userLogout")
	public String goLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/userFindId")
	public String goFindId() {
		
		return "user/login/userFindId";
	}
	
	@PostMapping("/sendCode")
	public ModelAndView sendCode(
			@RequestParam(value="user_name", required=true)String user_name,
			@RequestParam(value="user_email", required=true)String user_email,
			HttpSession session) {
		
		String validCode=emailService.makeCode();
		
		emailService.sendCode(user_email, validCode);
		session.setAttribute("validCode", validCode);
		session.setAttribute("codeTime", LocalDateTime.now().plusMinutes(5));
		
		ModelAndView mv=new ModelAndView();
		
		System.out.println(user_name+"님의 이메일"+user_email+"로 인증코드 "+validCode+"전송");
		return mv;
	}
}

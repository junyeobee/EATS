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
			System.out.println(map);
			System.out.println(map.get("USER_IDX"));
			System.out.println(map.get("USER_NICKNAME"));
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
			@RequestParam(value="userName", required=true)String userName,
			@RequestParam(value="userEmail", required=true)String userEmail,
			HttpSession session) {
		
		ModelAndView mv=new ModelAndView();
		String userId=service.findId(userName, userEmail);
		
		if(userId!=null && userId!="") {
			String validCode=emailService.makeCode();
			
			emailService.sendCode(userEmail, validCode);
			session.setAttribute("validCode", validCode);
			session.setAttribute("codeTime", LocalDateTime.now().plusMinutes(5));
			session.setAttribute("userId", userId);
		}
		
		mv.addObject("msg", "이메일 전송이 완료되었습니다.");
		mv.setViewName("user/login/findIdCheck");
		
		return mv;
	}
	
	@PostMapping("/checkCode")
	public ModelAndView validateCode(
			@RequestParam(value="userCode", required=true)String userCode,
			HttpSession session) {
		String validCode=(String)session.getAttribute("validCode");
		LocalDateTime expiration = (LocalDateTime) session.getAttribute("codeTime");
		
		String result="0";
		
		ModelAndView mv=new ModelAndView();
		
		if(validCode == null || expiration == null || LocalDateTime.now().isAfter(expiration)) {
			//시간 만료
			result="0";
		}else {
			if(userCode.equals(validCode)) {
				//인증번호 일치
				session.removeAttribute("validCode");
		        session.removeAttribute("codeTime");
		        result="1";
			}else {
				//인증번호 불일치
				result="2";
			}
		}
		
		mv.addObject("msg", result);
		mv.setViewName("user/login/findIdCheck");
		
		return mv;
	}
	
	@GetMapping("/showUserId")
	public ModelAndView showUserId(HttpSession session) {
		
		ModelAndView mv=new ModelAndView();
		String savedId=(String)session.getAttribute("userId");
		mv.addObject("userId", savedId);
		mv.setViewName("user/login/showId");
		
		session.removeAttribute("userId");
		return mv;
	}
	
	@GetMapping("/userFindPwd")
	public String userFindPwd() {
		
		return "user/login/userFindPwd";
	}
	
	@PostMapping("/idExist")
	public ModelAndView idCheckForFindPwd(String userId, HttpSession session) {
		
		String dbEmail=service.idCheckForFindId(userId);
		
		ModelAndView mv=new ModelAndView();
		boolean result;
		if(dbEmail==null || dbEmail=="") {
			result=false;
		}else {
			result=true;
			session.setAttribute("userId", userId);
		}
		
		mv.addObject("result", result);
		mv.setViewName("user/login/findPwdResult");
		
		return mv;
	}
	
	@PostMapping("/sendCodeForFindPwd")
	public ModelAndView sendCodeForFindPwd(String userId, String userEmail, HttpSession session) {
		
		String dbEmail=service.idCheckForFindId(userId);
		System.out.println("userID="+userId+"/userEmail="+userEmail);
		if(dbEmail!=null && dbEmail!="") {
			if(dbEmail.equals(userEmail)) {
				String validCode=emailService.makeCode();
				emailService.sendCode(userEmail, validCode);
				
				session.setAttribute("validCode", validCode);
				session.setAttribute("codeTime", LocalDateTime.now().plusMinutes(5));
			}
		}
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("result", "인증코드를 전송했습니다.");
		mv.setViewName("user/login/findPwdResult");
		
		return mv;
	}
	
	@PostMapping("/checkPwdCode")
	public ModelAndView validatePwdCode(
			@RequestParam(value="userCode", required=true)String userCode,
			HttpSession session) {
		String validCode=(String)session.getAttribute("validCode");
		LocalDateTime expiration = (LocalDateTime) session.getAttribute("codeTime");
		
		String result="0";
		
		ModelAndView mv=new ModelAndView();
		
		if(validCode == null || expiration == null || LocalDateTime.now().isAfter(expiration)) {
			//시간 만료
			result="0";
		}else {
			if(userCode.equals(validCode)) {
				//인증번호 일치
				session.removeAttribute("validCode");
		        session.removeAttribute("codeTime");
		        result="1";
			}else {
				//인증번호 불일치
				result="2";
			}
		}
		
		mv.addObject("result", result);
		mv.setViewName("user/login/findPwdResult");
		
		return mv;
	}
	
	@GetMapping("/userResetPwd")
	public String resetPwdForm(String userId, HttpSession session) {
		
		session.setAttribute("userId", userId);
		
		return "user/login/resetPwd";
	}
	
	@PostMapping("/userResetPwd")
	public ModelAndView resetPwd(String newPwd, HttpSession session) {
		
		String userId=(String)session.getAttribute("userId");
		ModelAndView mv=new ModelAndView();
		
		if(userId!=null && userId!="") {
			int result=service.userResetPwd(userId, newPwd);
			
			session.removeAttribute("userId");
			String msg=(result>0)?"비밀번호 변경 완료":"비밀번호 변경 실패";
			
			
			mv.addObject("result", msg);
			mv.setViewName("user/login/userPwdUpdate_ok");
		}
		
		
		return mv;
	}
}

package com.eats.controller.user;

import java.math.BigDecimal;
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

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class LoginController {
	
	@Autowired
	private UserLoginService service;
	
	@Autowired
	private EmailService emailService;
	
	//로그인 페이지로 이동
	@GetMapping("/user/login")
	public String goLogin(org.springframework.ui.Model model,
			HttpServletRequest request, HttpSession session) {
		
		String uri=request.getHeader("Referer");
		if(uri!=null && !uri.contains("user/login")) {
			session.setAttribute("callbackUri", uri);
		}
		//로그인 페이지로 이동
		return "/user/login/userLogin";
	}
	
	//로그인 제출
	@PostMapping("/user/login")
	public ModelAndView submitLogin(
			@RequestParam(value="userId", required = true)String userId,
			@RequestParam(value="userPwd", required = true)String userPwd,
			@RequestParam(value="saveId", required = false)String saveId,
			@RequestParam(value="callback", required = false) String callback, 
			HttpSession session, 
			HttpServletResponse resp,
			HttpServletRequest req) {
		
		//로그인 처리
		boolean result=service.loginCheck(userId, userPwd);

		ModelAndView mv=null;
		if(result) {
			String callbackUri=(String)session.getAttribute("callbackUri");
			
			mv=new ModelAndView("redirect:"+callbackUri);
			session.removeAttribute("callbackUri");
			Map<String, Object> map=service.getUserInfo(userId);
			BigDecimal user_idx_bd = (BigDecimal)map.get("USER_IDX");
			int user_idx=user_idx_bd.intValue();
			session.setAttribute("user_idx", user_idx);  // int로 변환해서 저장
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
			mv.setViewName("/user/login/loginMsg");
		}
		
		return mv;
	}
	
	//로그아웃
	@GetMapping("/user/logout")
	public String goLogout(HttpSession session, HttpServletRequest request) {
		//로그아웃 처리
		session.removeAttribute("user_idx");
		session.removeAttribute("user_nickname");
		
		String uri=request.getHeader("referer");
		System.out.println(uri);
		if(uri==null || uri.contains("/user/myPlate") || uri.contains("/timeLineMain") || uri.contains("mypage")) {
			uri="/";
		}else {
			uri=uri.substring(uri.indexOf("9090")+4);
		}
		return "redirect:"+uri;
	}
	
	//아이디찾기 페이지로 이동
	@GetMapping("/user/findId")
	public String goFindId() {
		
		return "user/login/userFindId";
	}
	
	//아이디를 찾기 위한 코드 전송
	@PostMapping("/user/findId/sendCode")
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
	
	//전송된 코드와 입력한 코드가 일치하는지 확인
	@PostMapping("/user/findId/checkCode")
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
	
	//아이디 보여주기
	@GetMapping("/user/showId")
	public ModelAndView showUserId(HttpSession session) {
		
		ModelAndView mv=new ModelAndView();
		String savedId=(String)session.getAttribute("userId");
		mv.addObject("userId", savedId);
		mv.setViewName("user/login/showId");
		
		session.removeAttribute("userId");
		return mv;
	}
	
	//비밀번호 찾기로 이동
	@GetMapping("/user/findPwd")
	public String userFindPwd() {
		return "user/login/userFindPwd";
	}
	
	//비밀번호를 찾기 위해 아이디가 존재하는지 확인
	@PostMapping("/user/findPwd/idExist")
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
	
	//비밀번호 찾기를 위한 코드 전송
	@PostMapping("/user/findPwd/sendCode")
	public ModelAndView sendCodeForFindPwd(String userId, String userEmail, HttpSession session) {
		
		String dbEmail=service.idCheckForFindId(userId);
		//System.out.println("userID="+userId+"/userEmail="+userEmail);
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
	
	//비밀번호 찾기를 위해 전송한 코드와 입력한 코드가 일치하는지 확인
	@PostMapping("/user/findPwd/checkCode")
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
	
	//비밀번호 재설정 페이지
	@GetMapping("/user/resetPwd")
	public String resetPwdForm(String userId, HttpSession session) {
		
		session.setAttribute("userId", userId);
		
		return "user/login/resetPwd";
	}
	
	//비밀번호 재설정 제출
	@PostMapping("/user/resetPwd")
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

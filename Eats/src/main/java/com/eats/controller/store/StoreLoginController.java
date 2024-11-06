package com.eats.controller.store;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eats.email.service.EmailService;
import com.eats.store.model.EatsStoreDTO;
import com.eats.store.service.StoreLoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class StoreLoginController {

	@Autowired
	private StoreLoginService service;

	@Autowired
	private EmailService emailService;

	@GetMapping("/storeLogin")
	public String storeLoginMain() {

		return "store/login/storeLogin";

	}

	@PostMapping("/storeLogin")
	public ModelAndView storeLoginSubmit(@RequestParam(value = "storeId", required = true) String storeId,
			@RequestParam(value = "storePwd", required = true) String storePwd,
			@RequestParam(value = "check", required = false) String ch, HttpSession session, HttpServletResponse resp) {

		ModelAndView mav = new ModelAndView();

		int result = service.storeLogin(storeId, storePwd);

		String msg = "";

		if (result == 3) {
			msg = "로그인 성공";
			mav.setViewName("store/login/storeLoginMsg");
			mav.addObject("goUrl", "storeLogin");

			Cookie ck = new Cookie("saveid", storeId);

			if (ck == null || ch.equals("")) {
				ck.setMaxAge(0);

			} else {
				ck.setMaxAge(60 * 60 * 30);

			}

			resp.addCookie(ck);

		} else {

			msg = "아이디 또는 비밀번호를 확인하세요.";
			mav.setViewName("store/login/storeLoginMsg");
			mav.addObject("goUrl", "storeLogin");
		}

		mav.addObject("msg", msg);

		return mav;

	}

	// 아이디 찾기

	@GetMapping("/storeFindIdPage")
	public String storeFindIdPage() {

		return "store/login/storeFindId";
	}

	@PostMapping("/storeFindId")
	public ModelAndView storeFindId(EatsStoreDTO dto) {

		ModelAndView mav = new ModelAndView();

		if (dto == null) {
			mav.setViewName("store/login/findIdResult");
			mav.addObject("message", "잘못된 요청입니다.");
		}

		String id = service.findId(dto);

		if (id == null || id.equals("")) {

			mav.setViewName("store/login/findIdResult");
			mav.addObject("message", "아이디를 찾을 수 없습니다.");

		} else {
			mav.setViewName("store/login/findIdResult");
			mav.addObject("findId", id);

		}

		return mav;
	}

	// 비밀번호 찾기
	@GetMapping("/storeFindPwdPage")
	public String storeFindPwdPage() {
		return "store/login/storeFindPwd";
	}


	@PostMapping("/storesendCodeForFindPwd")
	public ModelAndView storesendCodeForFindPwd(String storeEmail, HttpSession session) {

		String storeId=(String)session.getAttribute("storeId");
		String dbEmail=service.storeidCheckForFindId(storeId);
		System.out.println("storeId="+storeId+"/storeEmail="+storeEmail);
		if(dbEmail!=null && dbEmail!="") {
			if(dbEmail.equals(storeEmail)) {
				String validCode=emailService.makeCode();
				emailService.sendCode(storeEmail, validCode);
				
				session.setAttribute("validCode", validCode);
				session.setAttribute("codeTime", LocalDateTime.now().plusMinutes(5));
				System.out.println(validCode);
				System.out.println(LocalDateTime.now().plusMinutes(5));
			}
		}
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("result", "인증코드를 전송했습니다.");
		mv.setViewName("user/login/findPwdResult");
		
		return mv;
	}

	
	@GetMapping("/storeIdExist")
	public ModelAndView storeIdCheckForFindPwd(String storeId, HttpSession session) {
		String dbEmail=service.storeidCheckForFindId(storeId);
		ModelAndView mv= new ModelAndView();
		
		boolean result;
		if(dbEmail==null || dbEmail=="") {
			
			result=false;
		}else {
			
			result=true;
			session.setAttribute("storeId", storeId);
			
		}
		
		mv.addObject("result",result);
		mv.setViewName("user/login/findPwdResult");
		
		return mv;
		
	}
	
	@GetMapping("/storecheckCode")
	public ModelAndView storevalidateCode(@RequestParam(value = "storeCode", required = true) String storeCode,
			HttpSession session) {
		String validCode=(String) session.getAttribute("validCode");
		
		LocalDateTime expiration = (LocalDateTime) session.getAttribute("codeTime");
		
		String result = "0";
		System.out.println(validCode);
		System.out.println(storeCode);
		ModelAndView mav = new ModelAndView();;
		if (validCode == null || expiration == null || LocalDateTime.now().isAfter(expiration)) {
			// 시간 만료
			result = "0";
		} else {
			if (storeCode.equals(validCode)) {
				// 인증번호 일치
				System.out.println(true);
				session.removeAttribute("validCode");
				session.removeAttribute("codeTime");
				result = "1";
				System.out.println(result);
			} else {
				// 인증번호 불일치
				result = "2";
			}
		}
		mav.addObject("result", result);
		mav.setViewName("store/login/storeUpdatePwd");

		return mav;

	}
	
	
	//비밀번호 재설정
	@PostMapping("/storeUpdatePwd")
	public ModelAndView storeUpdatePwd(String newPwd, HttpSession session){
		
		String storeId=(String)session.getAttribute("storeId");
		int result=service.storeUpdatePwd(storeId, newPwd);
		
		String msg=(result>0)?"비밀번호가 변경되었습니다.":"다시 확인해주세요.";
		
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("result",msg);
		mav.setViewName("user/login/userPwdUpdate_ok");
		
		return mav;
	}


}

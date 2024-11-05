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

	
	
	@PostMapping("/store_sendCode")
	public ModelAndView sendCode(
			@RequestParam(value="store_id", required=true)String store_id,
			@RequestParam(value="store_email", required=true)String store_email,
			HttpSession session) {
		
		String validCode = emailService.makeCode();
		
		emailService.sendCode(store_email, validCode);
		session.setAttribute("validCode", validCode);
		session.setAttribute("codeTime", LocalDateTime.now().plusMinutes(5));
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("store/login/storeFindPwd");
		mav.addObject("store_id",store_id);
		mav.addObject("store_email",store_email);
		
		System.out.println(store_email+"로 인증코드 전송");
		
		return mav;
	}
	
	
}

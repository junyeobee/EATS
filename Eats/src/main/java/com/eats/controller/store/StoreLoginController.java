package com.eats.controller.store;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

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
	public ModelAndView storeLoginSubmit(
			@RequestParam(value = "store_id", required = true) String storeId,
			@RequestParam(value = "store_pwd", required = true) String storePwd,
			@RequestParam(value = "check", required = false) String ch, 
			HttpSession session, HttpServletResponse resp) {

		ModelAndView mav = new ModelAndView();
		 
		int storeIdx = service.storeLogin(storeId, storePwd);

		String msg = "";

		if (storeIdx > 0) {
			msg = "로그인 성공";
			
			session.setAttribute("storeId",storeId);
			
			session.setAttribute("storeIdx", storeIdx);
			
			System.out.println(storeIdx);
			
			mav.setViewName("store/login/storeLoginMsg");
			mav.addObject("goUrl", "storeMain"); //매장 index생기면 추후 변경

			Cookie ck = new Cookie("saveid", storeId);

			if (ch == null || ch.equals("")) {
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

	
	// 비밀번호 찾기 페이지 
	@GetMapping("/storeFindPwdPage")
	public String storeFindPwdPage() {
		return "store/login/storeFindPwd";
	}

	
	
	
	//비밀번호찾기 인증번호 메일발송
	
	@PostMapping("/storesendCodeForFindPwd")
	public ModelAndView storesendCodeForFindPwd(
			 @RequestParam("store_id") String storeId,
		        @RequestParam("store_email") String store_email,
			HttpSession session) {
		
		String dbEmail=service.storeidCheckForFindPwd(storeId);
		
		System.out.println(dbEmail);
		
		ModelAndView mv=new ModelAndView();
		
		  if (dbEmail != null && !dbEmail.isEmpty()) {
		        if (dbEmail.equals(store_email)) { 
		            String validCode = emailService.makeCode();
		            try {
		                emailService.sendCode(store_email, validCode); 
		                session.setAttribute("validCode", validCode);
		                session.setAttribute("codeTime", LocalDateTime.now().plusMinutes(5));
		                System.out.println(validCode);
		                System.out.println(LocalDateTime.now().plusMinutes(5));
		            } catch (Exception e) {
		                e.printStackTrace(); 
		                mv.addObject("result", "이메일 전송 중 오류가 발생했습니다.");
		                mv.setViewName("user/login/findPwdResult");
		                return mv;
		            }
		        } else {
		            mv.addObject("result", "이메일 주소가 일치하지 않습니다.");
		            mv.setViewName("user/login/findPwdResult");
		            return mv;
		        }
		    } else {
		        mv.addObject("result", "등록된 사용자 ID가 없습니다.");
		        mv.setViewName("user/login/findPwdResult");
		        return mv;
		    }

		  session.setAttribute("storeId", storeId);
		  
		    mv.addObject("result", "인증코드를 전송했습니다.");
		    mv.setViewName("user/login/findPwdResult");
		    
		    return mv;
		}

	
	
	
	//아이디 존재 확인
	@PostMapping("/storeIdExist")
	public ModelAndView storeIdCheckForFindPwd(String store_id, HttpSession session) {
		String dbEmail=service.storeidCheckForFindPwd(store_id);
		
		System.out.println(store_id);
		System.out.println(dbEmail);
		
		ModelAndView mv= new ModelAndView();
		
		boolean result;
		
		if(dbEmail==null || dbEmail=="") {
			
			result=false;
		}else {
			
			result=true;
			session.setAttribute("storeId", store_id);
			
		}
		
		System.out.println(result);
		
		mv.addObject("result",result);
		mv.setViewName("user/login/findPwdResult");
		
		return mv;
		
	}
	
	
	//인증코드 확인
	
	@PostMapping("/storecheckCode")
	public ModelAndView storevalidateCode(
			@RequestParam(value = "storeCode", required = true) String storeCode,
			HttpSession session) {
		String validCode=(String) session.getAttribute("validCode");
		
		LocalDateTime expiration = (LocalDateTime) session.getAttribute("codeTime");
		
		String result = "0";
		System.out.println(validCode);
		System.out.println(storeCode);
		
		ModelAndView mav = new ModelAndView();
		
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
		mav.setViewName("store/login/storeCheckCode_ok");

		return mav;

	}
	
	
	
	
	//비밀번호 재설정
	
	@GetMapping("storeUpdatePwd")
	public String storeUpdatePwdPage(HttpSession session) {
		
		 String storeId = (String) session.getAttribute("storeId");
			System.out.println("아이디111"+storeId);
		  if (storeId == null) {
		       
		        return "redirect:/storeLogin"; 
		    }

		
		return "store/login/storeUpdatePwd";
		
	}
	
	
	@PostMapping("storeUpdatePwdOk")
	public ModelAndView storeUpdatePwd(String newPwd, 
			HttpSession session){
		
		String storeId = (String) session.getAttribute("storeId");
		System.out.println("아이디222"+storeId);
		
		ModelAndView mav= new ModelAndView();
		
		if(storeId!=null && !storeId.isEmpty()) {

		int result=service.storeUpdatePwd(newPwd,storeId);
		session.removeAttribute("storeId");
		
		System.out.println("비번!!!"+result);
		String msg= result>0 ? "비밀번호가 변경되었습니다.":"다시 확인해주세요.";
		
		mav.addObject("result",msg);
		mav.setViewName("store/login/storeUpdatePwdOk");
		}
		return mav;
	}
	
	
	
	//로그아웃 
	
	@GetMapping("/storeLogout")
	public String storeLogout(HttpSession session) {
		
		session.invalidate();
		
		return "index";
	}
	

	
	



}

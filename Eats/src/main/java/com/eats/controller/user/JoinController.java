package com.eats.controller.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eats.email.service.EmailService;
import com.eats.user.model.EatsProfileDTO;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.service.UserLoginService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class JoinController {

	@Autowired UserLoginService userservice;
	@Autowired EmailService emailservice;
	
	@GetMapping("/userJoin")
	public String openUserJoin() {
		
		return "user/join/userJoin";
	}
	
	@PostMapping("/userJoin")
	public ModelAndView setUserJoin(
			@ModelAttribute EatsUserDTO userDTO, @ModelAttribute EatsProfileDTO profileDTO) {
		
		int result = userservice.insertuser(userDTO, profileDTO);
		
		ModelAndView mv = new ModelAndView();
		
		if(result==1) {
			mv.addObject("msg", "회원가입이 완료되었습니다.");
			mv.addObject("url", "/user/login");
			mv.setViewName("admin/login/adminMsg");
		} else {
			mv.addObject("msg", "회원가입에 실패하였습니다. 다시 시도해주세요.");
			mv.addObject("url", "/userJoin");
			mv.setViewName("admin/login/adminMsg");
		}
		
		return mv;
	}
	
	@PostMapping("/userCheck")
	@ResponseBody
	public Object checkDuplicate(@RequestBody Map<String, Object> param) {
		String userId = (String) param.get("userId");
		String userNick = (String) param.get("userNick");
		String userTel = (String) param.get("userTel");

		Map<String, String> mp = new HashMap<>();
		int iresult = userservice.idcheck(userId);
		int nresult = userservice.nickcheck(userNick);
		int tresult = userservice.telcheck(userTel);
		mp.put("iresult", Integer.toString(iresult));
		mp.put("nresult", Integer.toString(nresult));
		mp.put("tresult", Integer.toString(tresult));
		
		return mp;
	}
	
	@PostMapping("/sendEcode")
	@ResponseBody
	public Map<String, String> sendEmail(@RequestBody Map<String, String> param) {
		String userEmail = (String) param.get("userEmail");

		String code = emailservice.makeCode();
		emailservice.sendCode(userEmail, code);
		System.out.println(userEmail);
		System.out.println(code);
		
		Map<String, String> mp = new HashMap<>();
		mp.put("status", "success");
		mp.put("code", code);

		return mp;
	}
}

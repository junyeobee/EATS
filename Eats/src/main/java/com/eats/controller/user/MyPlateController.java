package com.eats.controller.user;

import java.io.File;
import java.io.IOException;
import java.lang.module.ModuleDescriptor.Requires;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.HYMenuCateDTO;
import com.eats.store.model.HYMenuDTO;
import com.eats.store.service.StoreInfoService;
import com.eats.user.model.AlarmDTO;
import com.eats.user.model.ReservationDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.service.MyplateService;
import com.eats.user.service.UserReviewService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPlateController {
	
	@Autowired
	private UserReviewService reviewService;
	
	@Autowired
	private MyplateService myplateService;
	
	@Autowired
	private StoreInfoService storeInfoService;
		
	@Value("${review.upload.path}")
	private String uploadPath;

	//리뷰 작성 페이지
	@GetMapping("/user/writeReview")
	public ModelAndView goWriteReview(
			@RequestParam(value="reserve_idx", required=true)int reserve_idx, HttpSession session, HttpServletRequest req) {
		
		ModelAndView mv=new ModelAndView();
		
		Integer user_idx = (Integer)session.getAttribute("user_idx");
		boolean revExist=myplateService.checkReviewExist(reserve_idx);
		int writer_idx=myplateService.checkWriter(reserve_idx);
		
		if(user_idx == null) {
			mv.addObject("msg", "로그인이 필요한 서비스입니다.");
			mv.addObject("goTo", "/user/login");
			mv.setViewName("user/myplate/msg");
			return mv;
		}else if(revExist) {
			mv.addObject("msg", "이미 리뷰가 작성되었습니다.");
			mv.addObject("goTo", "/user/myPlate");
			mv.setViewName("user/myplate/msg");
			return mv;
		}else if(user_idx != writer_idx) {
			mv.addObject("msg", "작성 권한이 없습니다.");
			mv.addObject("goTo", "/user/myPlate");
			mv.setViewName("user/myplate/msg");
			return mv;
		}
		
		Map storeInfo = reviewService.getStoreInfoByReserveIdx(reserve_idx);
		ReservationDTO reserveDTO = reviewService.getReserveInfo(reserve_idx);
		List<HYMenuCateDTO> menuCateList = reviewService.getMenuCateListByReserveIdx(reserve_idx);
		List<HYMenuDTO> menuList = reviewService.getMenuListByReserveIdx(reserve_idx);
		List<String> tagList = reviewService.tagList();
		
		if(storeInfo==null || storeInfo.size()==0 || reserveDTO==null || menuCateList==null || menuCateList.size()==0 
				|| menuList==null || menuList.size()==0 || tagList==null || tagList.size()==0 ) {
			mv.addObject("errorMsg", "잘못된 접근입니다.");
			mv.addObject("goTo", "/");
			mv.setViewName("user/myplate/error");
		}else {
			mv.addObject("storeInfo", storeInfo);
			mv.addObject("reserveDTO", reserveDTO);
			mv.addObject("menuCateList", menuCateList);
			mv.addObject("menuList", menuList);
			mv.addObject("tagList", tagList);
			mv.setViewName("user/myplate/writeReview");
		}
		return mv;
	}
	
	//작성한 리뷰 제출
	@PostMapping("/user/insertReview")
	@Transactional
	public ModelAndView reviewSubmit(
			@RequestParam("reserve_idx")int reserve_idx, 
			@RequestParam("rev_score")int rev_score, 
			@RequestParam("rev_content") String rev_content,  
			@RequestParam(value="images", required=false) List<MultipartFile> images, 
			@RequestParam("rev_menu") String rev_menu, 
			@RequestParam(value="rev_tag", required=false) String rev_tag,
			Model model, HttpServletRequest req,
			HttpSession session) {
		System.out.println(rev_content);
		String failedCallback=req.getHeader("Referer"); //실패 시 돌아갈 페이지 가져오기
		
		String projectPath=System.getProperty("user.dir");
		List<String> imgNameList = new ArrayList<String>();
		
		if( images!=null && !images.isEmpty() && images.size()>1 ) {
			File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }
	        
	        for (int i = 0; i < images.size(); i++) {
	            MultipartFile image = images.get(i);
	            String originalFilename = image.getOriginalFilename();
	            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	            
	            // 새 파일명 생성 (reserve_idx_순번.확장자)
	            String newFileName = reserve_idx + "_" + (i + 1) + extension;
	            
	            try {
	                //파일 저장
	                File newFile = new File(projectPath + uploadPath + newFileName);
	                image.transferTo(newFile);
	                
	                //리스트에 새로운 파일 이름 추가
	                imgNameList.add(newFileName);
	                
	                
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
		}else {
			System.out.println("images is null");
		}
		
		String dbSave="";	//db에 저장할 이미지명
		
		if(imgNameList.size()!=0 || imgNameList!=null) {
			for(int i=0; i<imgNameList.size(); i++) {
				if(i==0) {
					dbSave+=imgNameList.get(i);
				}else {
					dbSave+=","+imgNameList.get(i);
				}
			}
		}
		
		ReviewDTO dto=new ReviewDTO(0, reserve_idx, rev_score, rev_content, null, 1, dbSave, rev_menu, rev_tag);
		int result=reviewService.insertReview(dto);
		System.out.println(rev_content);
		ModelAndView mv=new ModelAndView();
		
		if(result>0) {
			//포인트지급
			Integer user_idx=(Integer)session.getAttribute("user_idx");
			int crPoint=reviewService.getCurPoint(user_idx);
			
			Map<String, Integer> pointParam=new HashMap<String, Integer>();
			pointParam.put("user_idx", user_idx);
			pointParam.put("update_point", crPoint+1000);
			int log_result=reviewService.pointLog(pointParam);
			if(log_result>0) {
				int pointResult=reviewService.givePoint(user_idx);
				if(pointResult>0) {
					mv.addObject("msg", "리뷰 등록 성공! 500p 지급완료!");
					mv.addObject("goTo", "/user/myPlate");
					System.out.println("리뷰 등록 성공! 포인트 지급 완료!");
				}
			}
		}else {
			mv.addObject("msg", "리뷰 등록 실패");
			mv.addObject("goTo", failedCallback);
		}
		
		mv.setViewName("user/myplate/msg");
		return mv;
	}
	
	//마이플레이트
	@GetMapping("/user/myPlate")
	public ModelAndView goMyPlate(
			HttpSession session) {
		Integer user_idx = (Integer)session.getAttribute("user_idx");
		List<Map<String, BigDecimal>> cntList = myplateService.getReserveCntByState(user_idx);
		
		//방문예정, 방문완료, 취소노쇼의 총 예약 개수
		int readyCnt=cntList.get(0).get("COUNT").intValue()+cntList.get(1).get("COUNT").intValue();//방문전
		int finCnt=cntList.get(3).get("COUNT").intValue(); //방문완료
		int cancledCnt=cntList.get(2).get("COUNT").intValue()+cntList.get(4).get("COUNT").intValue(); //취소노쇼
		
		//예약정보들
		List<Map> reserveList = myplateService.getReserveInfoList(user_idx);
		
		for(int i=0; i<reserveList.size(); i++) {
			BigDecimal reserve_idx_bd=(BigDecimal)reserveList.get(i).get("RESERVE_IDX");
			int reserve_idx=reserve_idx_bd.intValue();
			BigDecimal reserve_st_bd=(BigDecimal)reserveList.get(i).get("RESERVE_STATE");
			int reserve_state=reserve_st_bd.intValue();
			if(reserve_state==3) {
				//예약완료건의 경우 작성된 리뷰가 있는지 확인하여 저장
				boolean revExist=myplateService.checkReviewExist(reserve_idx);
				reserveList.get(i).put("REV_EXIST", revExist);
			}else if(reserve_state==0 || reserve_state==1) {
				//방문예정인 경우 방문 며칠 전인지 저장
				int dDay=myplateService.getDday(reserve_idx);
				reserveList.get(i).put("D_DAY", dDay);
			}
		}
		
		//알림신청 목록
		List<AlarmDTO> alarmList = myplateService.getAlarmList(user_idx);
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("readyCnt", readyCnt);	//방문 예정 개수
		mv.addObject("finCnt", finCnt); //방문 완료 개수
		mv.addObject("cancledCnt", cancledCnt); //취소, 노쇼 개수
		mv.addObject("reserveList",  reserveList);	//예약 목록
		mv.addObject("alarmList", alarmList); //알림신청 목록
		
		mv.setViewName("user/myplate/main");
		return mv;
	}
	
	//예약 상세정보 페이지
	@GetMapping("/user/reserveInfo")
	public ModelAndView reserveInfo(int reserve_idx) {
		ModelAndView mv=new ModelAndView();
		
		ReservationDTO reservation = myplateService.getReserveInfo(reserve_idx);
		int reserve_state=reservation.getReserve_state();
		
		String state="";
		switch (reserve_state) {
			case 0:
			case 1:
				state="방문예정";
				
				break;
			case 2:state="취소";break;
			case 3:state="방문완료";break;
			case 4:state="노쇼";break;
			default:break;
		}
		if(reserve_state==3) {
			//예약완료건의 경우 작성된 리뷰가 있는지 확인하여 저장
			boolean revExist=myplateService.checkReviewExist(reserve_idx);
			mv.addObject("revExist", revExist);
			if(revExist) {
				Map<String, Object> revInfoMap = myplateService.getRevInfo(reserve_idx);
				String imgstr = (String)revInfoMap.get("REV_IMG");
				if(imgstr!=null && imgstr!="") {
					List<String> imgList = Arrays.stream(imgstr.split(","))
							.map(String::trim)
							.collect(Collectors.toList());
					revInfoMap.put("imgList", imgList);
				}
				String tagstr=(String)revInfoMap.get("REV_TAG");
				if(tagstr!=null && tagstr!="") {
					List<String> tagList = Arrays.stream(tagstr.split(","))
							.map(String::trim)
							.collect(Collectors.toList());
					
					revInfoMap.put("tagList", tagList);
				}
				String menustr=(String)revInfoMap.get("REV_MENU");
				if(menustr!=null && menustr!="") {
					List<Integer> menuIdxList=Arrays.stream(menustr.split(","))
							.map(String::trim)
							.map(Integer::parseInt)
							.collect(Collectors.toList());
					
					List<HYMenuDTO> revMenuList=storeInfoService.getRevMenuList(menuIdxList);
					
					revInfoMap.put("revMenuList", revMenuList);
				}
				mv.addObject("revInfoMap", revInfoMap);
			}
		}else if(reserve_state==0 || reserve_state==1) {
			//방문예정인 경우 방문 며칠 전인지 저장
			int dDay=myplateService.getDday(reserve_idx);
			System.out.println(dDay);
			mv.addObject("dDay", dDay);
		}
		
		mv.addObject("reserveDTO", reservation);
		mv.addObject("state", state);
		mv.setViewName("user/myplate/reserveInfo");
		return mv;
	}
	
	@GetMapping("/user/cancelReserve")
	public ModelAndView cancelReserve(int reserve_idx) {
		ModelAndView mv=new ModelAndView();
		
		int cancelResult = myplateService.cancelReserve(reserve_idx);
		String msg="";
		String goTo="/user/reserveInfo?reserve_idx="+reserve_idx;
		if(cancelResult>0) {
			msg="예약이 취소되었습니다.";
		}else {
			msg="취소에 실패했습니다. 다시 시도해주세요.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("goTo", goTo);
		mv.setViewName("/user/myplate/msg");
		return mv;
	}
	
	@PostMapping("/user/myplate/getTodayList")
	@ResponseBody
	public Map<String, List> myplateCalendar(String date, HttpSession session){
		Integer user_idx = (Integer)session.getAttribute("user_idx");
		Map param = new HashMap<>();
		param.put("user_idx", user_idx);
		param.put("date", date);
		
		Map<String, List> map = new HashMap<>();
		
		if(user_idx != null) {
			List<ReservationDTO> reserveList = myplateService.reserveListCal(param);
			List<AlarmDTO> alarmList = myplateService.alarmListCal(param);
			
			map.put("reserveList", reserveList);
			map.put("alarmList", alarmList);
		}
		
		return map;
	}
}
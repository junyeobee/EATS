package com.eats.controller.store;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreImgDTO;
import com.eats.store.service.StoreImgService;

@Controller
public class ImgController {

    @Autowired
    private StoreImgService service;

    //파일 저장위치
    private final String filePath = "C:/ssangyoung_java/eats/EATS/Eats/src/main/webapp/storeUploadImg/";
    
    //파일명 담는 변수
    private String fileRealName1 = "";
    private String fileRealName2 = "";
    private String fileRealName3 = "";
    private String fileRealName4 = "";
    private String fileRealName5 = "";
    
    //파일 확장자 담는 변수    
    private String extension1 = "";
    private String extension2 = "";
    private String extension3 = "";
    private String extension4 = "";
    private String extension5 = "";

    //파일명 저장시 현재날짜, 시간 담음
    private DateTimeFormatter timestamp = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
    String timestampDate = LocalDateTime.now().format(timestamp);
    
    //저장되는 파일명 담는 변수
    private String fileNameWithTime1 = "";
    private String fileNameWithTime2 = "";
    private String fileNameWithTime3 = "";
    private String fileNameWithTime4 = "";
    private String fileNameWithTime5 = "";
    
    
    //db에 저장되는 파일 경로
    private String db_filePath = "/storeUploadImg/";
    
    
    @GetMapping("/store/storeImg")
    public ModelAndView storeImg() {
        StoreImgDTO data = service.storeImgData(); // 서비스에서 단일 객체를 반환
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data); // JSP로 객체 전달
        mav.setViewName("store/imgControl/imgCont"); // JSP 이름

        return mav;
    }
    
    @PostMapping("/store/imgSave")
    public ModelAndView imgSave( 
    	//사용안할예정
    	@RequestParam(value = "store_idx") int store_idx,
        @RequestParam(value = "store_img1", required = false) MultipartFile file1,
        @RequestParam(value = "store_img2", required = false) MultipartFile file2,
        @RequestParam(value = "store_img3", required = false) MultipartFile file3,
        @RequestParam(value = "store_img4", required = false) MultipartFile file4,
        @RequestParam(value = "store_img5", required = false) MultipartFile file5) {

        // 파일명 초기화 (파일이 없으면 빈 문자열로 처리)
        String fileName1 = (file1 != null && !file1.isEmpty()) ? file1.getOriginalFilename() : "";
        String fileName2 = (file2 != null && !file2.isEmpty()) ? file2.getOriginalFilename() : "";
        String fileName3 = (file3 != null && !file3.isEmpty()) ? file3.getOriginalFilename() : "";
        String fileName4 = (file4 != null && !file4.isEmpty()) ? file4.getOriginalFilename() : "";
        String fileName5 = (file5 != null && !file5.isEmpty()) ? file5.getOriginalFilename() : "";

        // 파일명이 비어 있지 않으면 확장자 앞까지만 잘라냄
        if (!fileName1.isEmpty()) {
            int extensionIndex = fileName1.lastIndexOf("."); // 확장자 시작 위치
            if (extensionIndex > 0) { // 확장자가 존재하는 경우
            	fileRealName1 = fileName1.substring(0, extensionIndex); // 확장자 앞까지 자름, 파일명 추출
                extension1 = fileName1.substring(extensionIndex);	//확장자 추출
                fileNameWithTime1 = fileRealName1 +"_"+ timestampDate + extension1;	//저장 파일명 생성
            }
        }

        if (!fileName2.isEmpty()) {
            int extensionIndex = fileName2.lastIndexOf(".");
            if (extensionIndex > 0) {
            	fileRealName2 = fileName2.substring(0, extensionIndex);
                extension2 = fileName2.substring(extensionIndex);
                fileNameWithTime2 = fileRealName2 +"_"+ timestampDate + extension2;
            }
        }

        if (!fileName3.isEmpty()) {
            int extensionIndex = fileName3.lastIndexOf(".");
            if (extensionIndex > 0) {
            	fileRealName3 = fileName3.substring(0, extensionIndex);
            	extension3 = fileName3.substring(extensionIndex);
                fileNameWithTime3 = fileRealName3 +"_"+ timestampDate + extension3;
            }
        }

        if (!fileName4.isEmpty()) {
            int extensionIndex = fileName4.lastIndexOf(".");
            if (extensionIndex > 0) {
            	fileRealName4 = fileName4.substring(0, extensionIndex);
            	extension4 = fileName4.substring(extensionIndex);
                fileNameWithTime4 = fileRealName4 +"_"+ timestampDate + extension4;
            }
        }

        if (!fileName5.isEmpty()) {
            int extensionIndex = fileName5.lastIndexOf(".");
            if (extensionIndex > 0) {
            	fileRealName5 = fileName5.substring(0, extensionIndex);
            	extension5 = fileName5.substring(extensionIndex);
                fileNameWithTime5 = fileRealName5 +"_"+ timestampDate + extension5;
            }
        }

        try {
            // 파일 저장 처리 (파일이 있을 경우에만)
            String filePath1 = !fileName1.isEmpty() ? uploadFile(file1, filePath, fileNameWithTime1) : "";
            String filePath2 = !fileName2.isEmpty() ? uploadFile(file2, filePath, fileNameWithTime2) : "";
            String filePath3 = !fileName3.isEmpty() ? uploadFile(file3, filePath, fileNameWithTime3) : "";
            String filePath4 = !fileName4.isEmpty() ? uploadFile(file4, filePath, fileNameWithTime4) : "";
            String filePath5 = !fileName5.isEmpty() ? uploadFile(file5, filePath, fileNameWithTime5) : "";
            
            System.out.println("filePath1: " + filePath1);

            // 상대 경로 반환 (예: "/storeUploadImg/파일명")
            //return relativePath;
            
            StoreImgDTO storeImgDTO = new StoreImgDTO();
            storeImgDTO.setStore_img1(db_filePath+fileNameWithTime1);
            storeImgDTO.setStore_img2(db_filePath+fileNameWithTime2);
            storeImgDTO.setStore_img3(db_filePath+fileNameWithTime3);
            storeImgDTO.setStore_img4(db_filePath+fileNameWithTime4);
            storeImgDTO.setStore_img5(db_filePath+fileNameWithTime5);
            
            storeImgDTO.setStore_idx(store_idx);	//매장기본키
            int result = service.storeImgInsert(storeImgDTO);
            String msg = result > 0 ? "이미지 등록 완료되었습니다." : "이미지가 등록되지 않았습니다.";
            String goPage = "storeImg";

            ModelAndView mav = new ModelAndView();
            mav.addObject("msg", msg);
            mav.addObject("goPage", goPage);
            mav.setViewName("store/common/basicMsg");

            return mav;

        } catch (IOException e) {
            System.out.println("파일 업로드 실패: " + e.getMessage());
            ModelAndView mav = new ModelAndView();
            mav.setViewName("store/common/errorPage");  // 오류 페이지로 리다이렉트
            return mav;
        }
    }
    
    
    @PostMapping("/store/imgUpdate")
    public ModelAndView imgUpdate( 
    	@RequestParam(value = "store_idx") int store_idx,
    	@RequestParam(value = "si_idx") int si_idx,
        @RequestParam(value = "store_img1", required = false) MultipartFile file1,
        @RequestParam(value = "store_img2", required = false) MultipartFile file2,
        @RequestParam(value = "store_img3", required = false) MultipartFile file3,
        @RequestParam(value = "store_img4", required = false) MultipartFile file4,
        @RequestParam(value = "store_img5", required = false) MultipartFile file5,

        @RequestParam(value = "store_img1_db", required = false) String db_img1,
        @RequestParam(value = "store_img2_db", required = false) String db_img2,
        @RequestParam(value = "store_img3_db", required = false) String db_img3,
        @RequestParam(value = "store_img4_db", required = false) String db_img4,
        @RequestParam(value = "store_img5_db", required = false) String db_img5) {
    	
        // 파일명 초기화 (파일이 없으면 빈 문자열로 처리)
        String fileName1 = (file1 != null && !file1.isEmpty()) ? file1.getOriginalFilename() : "";
        String fileName2 = (file2 != null && !file2.isEmpty()) ? file2.getOriginalFilename() : "";
        String fileName3 = (file3 != null && !file3.isEmpty()) ? file3.getOriginalFilename() : "";
        String fileName4 = (file4 != null && !file4.isEmpty()) ? file4.getOriginalFilename() : "";
        String fileName5 = (file5 != null && !file5.isEmpty()) ? file5.getOriginalFilename() : "";

        // 파일명이 비어 있지 않으면 확장자 앞까지만 잘라냄
        if (!fileName1.isEmpty()) {
            int extensionIndex = fileName1.lastIndexOf("."); // 확장자 시작 위치
            if (extensionIndex > 0) { // 확장자가 존재하는 경우
            	fileRealName1 = fileName1.substring(0, extensionIndex); // 확장자 앞까지 자름, 파일명 추출
                extension1 = fileName1.substring(extensionIndex);	//확장자 추출
                fileNameWithTime1 = fileRealName1 +"_"+ timestampDate + extension1;	//저장 파일명 생성
            }
        }

        if (!fileName2.isEmpty()) {
            int extensionIndex = fileName2.lastIndexOf(".");
            if (extensionIndex > 0) {
            	fileRealName2 = fileName2.substring(0, extensionIndex);
                extension2 = fileName2.substring(extensionIndex);
                fileNameWithTime2 = fileRealName2 +"_"+ timestampDate + extension2;
            }
        }

        if (!fileName3.isEmpty()) {
            int extensionIndex = fileName3.lastIndexOf(".");
            if (extensionIndex > 0) {
            	fileRealName3 = fileName3.substring(0, extensionIndex);
            	extension3 = fileName3.substring(extensionIndex);
                fileNameWithTime3 = fileRealName3 +"_"+ timestampDate + extension3;
            }
        }

        if (!fileName4.isEmpty()) {
            int extensionIndex = fileName4.lastIndexOf(".");
            if (extensionIndex > 0) {
            	fileRealName4 = fileName4.substring(0, extensionIndex);
            	extension4 = fileName4.substring(extensionIndex);
                fileNameWithTime4 = fileRealName4 +"_"+ timestampDate + extension4;
            }
        }

        if (!fileName5.isEmpty()) {
            int extensionIndex = fileName5.lastIndexOf(".");
            if (extensionIndex > 0) {
            	fileRealName5 = fileName5.substring(0, extensionIndex);
            	extension5 = fileName5.substring(extensionIndex);
                fileNameWithTime5 = fileRealName5 +"_"+ timestampDate + extension5;
            }
        }


        try {
            // 파일 저장 처리 (파일이 있을 경우에만)
            String filePath1 = !fileName1.isEmpty() ? uploadFile(file1, filePath, fileNameWithTime1) : "";
            String filePath2 = !fileName2.isEmpty() ? uploadFile(file2, filePath, fileNameWithTime2) : "";
            String filePath3 = !fileName3.isEmpty() ? uploadFile(file3, filePath, fileNameWithTime3) : "";
            String filePath4 = !fileName4.isEmpty() ? uploadFile(file4, filePath, fileNameWithTime4) : "";
            String filePath5 = !fileName5.isEmpty() ? uploadFile(file5, filePath, fileNameWithTime5) : "";
            
            System.out.println("filePath1: " + filePath1);

            // 상대 경로 반환 (예: "/storeUploadImg/파일명")
            //return relativePath;
            
            StoreImgDTO storeImgDTO = new StoreImgDTO();
            
            if(fileName1 != "") {
                storeImgDTO.setStore_img1(db_filePath+fileNameWithTime1);
            }else {
                storeImgDTO.setStore_img1(db_img1);
            }
            
            if(fileName2 != "") {
                storeImgDTO.setStore_img2(db_filePath+fileNameWithTime2);
            }else {
                storeImgDTO.setStore_img2(db_img2);
            }
            
            if(fileName3 != "") {
                storeImgDTO.setStore_img3(db_filePath+fileNameWithTime3);
            }else {
                storeImgDTO.setStore_img3(db_img3);
            }
            if(fileName4 != "") {
                storeImgDTO.setStore_img4(db_filePath+fileNameWithTime4);
            }else {
                storeImgDTO.setStore_img4(db_img4);
            }
            if(fileName5 != "") {
                storeImgDTO.setStore_img5(db_filePath+fileNameWithTime5);
            }else {
                storeImgDTO.setStore_img5(db_img5);
            }
            
            storeImgDTO.setStore_idx(store_idx);	//매장기본키            
            storeImgDTO.setSi_idx(si_idx);	//이미지테이블 기본키

            // DB에 저장
            int result = service.storeImgUpdate(storeImgDTO);

            // 결과 메시지
            String msg = result > 0 ? "이미지 수정 완료되었습니다." : "이미지가 수정되지 않았습니다.";
            String goPage = "storeImg";

            ModelAndView mav = new ModelAndView();
            mav.addObject("msg", msg);
            mav.addObject("goPage", goPage);
            mav.setViewName("store/common/basicMsg");

            return mav;

        } catch (IOException e) {
            System.out.println("파일 업로드 실패: " + e.getMessage());
            ModelAndView mav = new ModelAndView();
            mav.setViewName("store/common/errorPage");  // 오류 페이지로 리다이렉트
            return mav;
        }
    }

    private String uploadFile(MultipartFile file, String uploadDir, String filename) throws IOException {
    	
        // 업로드 디렉토리 경로 + 파일 이름으로 실제 저장할 파일 경로 생성
        Path path = Paths.get(uploadDir, filename);

        // 업로드 디렉토리가 존재하지 않으면 디렉토리 생성
        if (!Files.exists(Paths.get(uploadDir))) {
            Files.createDirectories(Paths.get(uploadDir));
        }

        // 파일을 업로드 디렉토리에 저장 (파일이 존재하면 덮어쓰도록 설정)
        Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

        // 저장된 파일의 경로 반환
        return path.toString(); 
    }
    

    
    @PostMapping("/store/imgUpDel")
    public ModelAndView imgUpDel( 
    	@RequestParam(value = "store_idx") int store_idx,
    	@RequestParam(value = "si_idx") int si_idx,
        @RequestParam(value = "img_num") int img_num,

        @RequestParam(value = "store_img1_db", required = false) String db_img1,
        @RequestParam(value = "store_img2_db", required = false) String db_img2,
        @RequestParam(value = "store_img3_db", required = false) String db_img3,
        @RequestParam(value = "store_img4_db", required = false) String db_img4,
        @RequestParam(value = "store_img5_db", required = false) String db_img5) {
    	
    	StoreImgDTO storeImgDTO = new StoreImgDTO();

        storeImgDTO.setStore_img1(db_img1);
        storeImgDTO.setStore_img2(db_img2);
        storeImgDTO.setStore_img3(db_img3);
        storeImgDTO.setStore_img4(db_img4);
        storeImgDTO.setStore_img5(db_img5);
        
        System.out.println(db_img1);
        System.out.println(db_img2);
        System.out.println(db_img3);
        System.out.println(db_img4);
        System.out.println(db_img5);
    	
    	if(img_num == 1 || storeImgDTO.getStore_img1() == null) {
            storeImgDTO.setStore_img1("");
    	}
    	if(img_num == 2 || storeImgDTO.getStore_img2() == null) {
            storeImgDTO.setStore_img2("");
    	}
    	if(img_num == 3 || storeImgDTO.getStore_img3() == null) {
            storeImgDTO.setStore_img3("");
    	}
    	if(img_num == 4 || storeImgDTO.getStore_img4() == null) {
            storeImgDTO.setStore_img4("");
    	}
    	if(img_num == 5 || storeImgDTO.getStore_img5() == null) {
            storeImgDTO.setStore_img5("");
    	}
        
        storeImgDTO.setStore_idx(store_idx);	//매장기본키            
        storeImgDTO.setSi_idx(si_idx);	//이미지테이블 기본키
        
        System.out.println("1::::"+storeImgDTO.getSi_idx());
        System.out.println("1::::"+storeImgDTO.getStore_idx());
        System.out.println("1::::"+storeImgDTO.getStore_img1());
        System.out.println("1::::"+storeImgDTO.getStore_img2());
        System.out.println("1::::"+storeImgDTO.getStore_img3());
        System.out.println("1::::"+storeImgDTO.getStore_img4());
        System.out.println("1::::"+storeImgDTO.getStore_img5());

        // DB에 저장
        int result = service.storeImgUpDel(storeImgDTO);

        // 결과 메시지
        String msg = result > 0 ? "이미지 삭제 완료되었습니다." : "이미지가 삭제되지 않았습니다.";
        String goPage = "storeImg";

        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
}

package com.eats.controller.store;

import java.io.IOException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreImgBeforeDTO;
import com.eats.store.model.StoreImgDTO;
import com.eats.store.model.StoreNewsDTO;
import com.eats.store.service.StoreImgService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ImgController {

    @Autowired
    private StoreImgService service;

    //파일명 저장시 현재날짜, 시간 담음
    private DateTimeFormatter timestamp = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss");
    String timestampDate = LocalDateTime.now().format(timestamp);
    
    @GetMapping("/store/storeImg")
    public ModelAndView storeImg() {
    	//과거버전 현재사용안함
        StoreImgBeforeDTO data = service.storeImgBeforeData(); // 서비스에서 단일 객체를 반환
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data); // JSP로 객체 전달
        mav.setViewName("store/imgControl/imgCont"); // JSP 이름

        return mav;
    }
    
    @GetMapping("/store/storeImage")
    public ModelAndView storeImage(@SessionAttribute(value = "store_idx", required = false) Integer store_idx) {
		
        // store_idx가 null이면 기본값을 1로 설정
        if (store_idx == null) {
            store_idx = 1;  // 기본값 설정
        }

        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        String filePathPrefix = req.getServletContext().getRealPath("\\img\\");
        
		List<StoreImgDTO> lists = service.storeImgData(store_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("imgUrl", filePathPrefix);
        mav.setViewName("store/imgControl/imgControl"); // JSP 이름

        return mav;
    }
    
    @PostMapping("/store/imgUpdate2")
    public ModelAndView imgUpdate2( 
        @RequestParam(value = "store_idx") int store_idx,
        @RequestParam(value = "store_imgs", required = false) List<MultipartFile> storeImgs,  // List<MultipartFile>로 파일 받기
        @RequestParam(value = "store_img_db", required = false) List<String> dbImgs,
        @RequestParam(value = "img_order", required = false) List<Integer> img_order,
        @RequestParam(value = "store_img_idx", required = false) List<Integer> store_img_idx) {  // List<String>으로 DB 이미지 경로 받기
    	    	
    	HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        
        String filePathPrefix = req.getServletContext().getRealPath("\\img\\storeUploadImg\\");
        
        String[] dbImgsArray = dbImgs != null ? dbImgs.toArray(new String[dbImgs.size()]) : new String[storeImgs.size()];
        String[] fileRealNames = new String[storeImgs.size()];
        String[] extensions = new String[storeImgs.size()];
        String[] fileWithTimes = new String[storeImgs.size()];
                
        int result = 0;

        for (int i = 0; i < storeImgs.size(); i++) {
            MultipartFile file = storeImgs.get(i);
            String fileName = file.getOriginalFilename();
            
            if (!fileName.isEmpty()) {
                int extensionIndex = fileName.lastIndexOf(".");
                if (extensionIndex > 0) {
                    fileRealNames[i] = fileName.substring(0, extensionIndex);  // 파일명
                    extensions[i] = fileName.substring(extensionIndex); // 확장자 
                    fileWithTimes[i] = fileRealNames[i] + "_" + timestampDate + extensions[i]; 
                }
            }
        }

        try {
            String[] filePaths = new String[storeImgs.size()];
            
            for (int i = 0; i < storeImgs.size(); i++) {

                if (!storeImgs.get(i).isEmpty()) {
                    
                    uploadFile(storeImgs.get(i), filePathPrefix, fileWithTimes[i], i);
                    
                    StoreImgDTO storeImgDTO = new StoreImgDTO();
                    storeImgDTO.setStore_idx(store_idx);
                    storeImgDTO.setStore_img(fileWithTimes[i]);
                    storeImgDTO.setImg_order(img_order.get(i)); 
                    
                    //업데이트
                    if (!dbImgs.get(i).isEmpty()) {
                        storeImgDTO.setSi_idx(store_img_idx.get(i));	//저장된 si_idx 가져옴
                        result += service.storeImgUpdate(storeImgDTO);
                        System.out.println("이미지 업데이트: " + fileWithTimes[i]);
                        
                    //insert
                    } else {
                        result += service.storeImgInsert(storeImgDTO);  // DB 삽입 처리
                        System.out.println("이미지 삽입: " + fileWithTimes[i]);
                    }
                }
            }

            // 결과 메시지
            if (result <= 0) {
                // 삽입 실패한 경우
                String msg = "이미지 저장에 실패했습니다.";
                ModelAndView mav = new ModelAndView();
                mav.addObject("msg", msg);
                mav.addObject("goPage", "storeImage");
                mav.setViewName("store/common/basicMsg");
                return mav;
            }
            
            String msg = "이미지가 성공적으로 등록되었습니다.";
            String goPage = "storeImage";

            ModelAndView mav = new ModelAndView();
            mav.addObject("msg", msg);
            mav.addObject("goPage", goPage);
            mav.setViewName("store/common/basicMsg");

            return mav;

        } catch (IOException e) {
            System.out.println("파일 업로드 실패: " + e.getMessage());
            ModelAndView mav = new ModelAndView();
            mav.setViewName("store/common/errorPage33");  // 오류 페이지로 리다이렉트
            return mav;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView mav = new ModelAndView();
            mav.setViewName("store/common/errorPage44");  // 오류 페이지로 리다이렉트
            return mav;
        }
    }


    private String uploadFile(MultipartFile file, String uploadDir, String filename, Integer test) throws IOException {
    	
    	System.out.println("test"+test);
    	
        Path path = Paths.get(uploadDir, filename);
    	System.out.println("path"+path);

        if (!Files.exists(Paths.get(uploadDir))) {
            Files.createDirectories(Paths.get(uploadDir));
        	System.out.println("uploadDir"+uploadDir);
        }

        Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
    	System.out.println("file.getInputStream()"+file.getInputStream());
    	System.out.println("path.toString()"+path.toString());

        return path.toString(); 
    }

    @PostMapping("/store/imgUpDel2")
    public ModelAndView imgUpDel2( 
    	@RequestParam(value = "store_idx") int store_idx,
    	@RequestParam(value = "si_idx") int si_idx) {
    	
    	StoreImgDTO storeImgDTO = new StoreImgDTO();
        storeImgDTO.setSi_idx(si_idx);	//이미지테이블 기본키

        int result = service.storeImgUpDel2(si_idx);

        String msg = result > 0 ? "이미지 삭제 완료되었습니다." : "이미지가 삭제되지 않았습니다.";
        String goPage = "storeImage";

        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
}

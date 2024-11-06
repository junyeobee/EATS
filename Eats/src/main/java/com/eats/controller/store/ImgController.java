package com.eats.controller.store;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eats.store.model.StoreImgDTO;
import com.eats.store.service.StoreImgService;

@Controller
public class ImgController {

    @Autowired
    private StoreImgService service;

    //private final String filePath = "C:/Users/userName/saveFolder"; // 업로드할 디렉토리 경로, storeImgService와 맞춰주기!!
    private final String filePath = "C:/EATS/Eats/src/main/webapp/storeUploadImg/";
    

    /*
    @GetMapping("/store/storeImg")
    public String storeImg() {
        return "store/imgControl/imgCont";
    }
    */

    @GetMapping("/store/storeImg")
    public ModelAndView storeImg() {
        // 서비스에서 하나의 StoreImgDTO 객체를 가져옴
        StoreImgDTO data = service.storeImgData(); // 서비스에서 단일 객체를 반환
        ModelAndView mav = new ModelAndView();
        mav.addObject("data", data); // JSP로 객체 전달
        System.out.println(data.toString());
        mav.setViewName("store/imgControl/imgCont"); // JSP 이름

        return mav;
    }
    
    /*
     * 해당소스 수정작업진행중
    @PostMapping("/store/imgSave")
    public ModelAndView StoreImgAdd(StoreImgDTO dto, 
                                     @RequestParam("store_img1") List<MultipartFile> files1, 
                                     @RequestParam("store_img2") List<MultipartFile> files2,
                                     @RequestParam("store_img3") List<MultipartFile> files3,
                                     @RequestParam("store_img4") List<MultipartFile> files4,
                                     @RequestParam("store_img5") List<MultipartFile> files5) throws IOException {

        File uploadDir = new File(filePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        List<List<MultipartFile>> allFiles = Arrays.asList(files1, files2, files3, files4, files5);
        
        
        //List<List<String>> imagePathsList = Arrays.asList(dto.getStore_img1(), dto.getStore_img2(), dto.getStore_img3(), dto.getStore_img4(), dto.getStore_img5());
        
        // 각 인덱스마다 ArrayList<String>을 생성하여 List<List<String>>을 초기화
        List<List<String>> imagePathsList = new ArrayList<>();
        imagePathsList.add(new ArrayList<>());  // dto.getStore_img1()에 해당하는 빈 리스트 추가
        imagePathsList.add(new ArrayList<>());  // dto.getStore_img2()에 해당하는 빈 리스트 추가
        imagePathsList.add(new ArrayList<>());  // dto.getStore_img3()에 해당하는 빈 리스트 추가
        imagePathsList.add(new ArrayList<>());  // dto.getStore_img4()에 해당하는 빈 리스트 추가
        imagePathsList.add(new ArrayList<>());  // dto.getStore_img5()에 해당하는 빈 리스트 추가
        */
        /*
        for (int idx = 0; idx < allFiles.size(); idx++) {
            List<MultipartFile> files = allFiles.get(idx);

            for (MultipartFile file : files) {
                String path = "";
                if (!file.isEmpty()) {
                    String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                    File destFile = new File(filePath + fileName);
                    file.transferTo(destFile);
                    //path = filePath + fileName;
                    path = fileName;
                }
                imagePathsList.get(idx).add(path);
            }
        }
        */
        /*
		for (int idx = 0; idx < allFiles.size(); idx++) {
		    List<MultipartFile> files = allFiles.get(idx);
		
		    for (MultipartFile file : files) {
		        String path = "";
		        if (!file.isEmpty()) {
		            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		            File destFile = new File(filePath + fileName);
		            file.transferTo(destFile);
		            path = fileName;
		        }
		
		        // 각 List<String>에 경로를 추가
		        imagePathsList.get(idx).add(path);
		    }
		}

        int result = service.storeImgInsert(dto);

        String msg = result > 0 ? "이미지 등록 완료되었습니다." : "이미지가 등록되지 않았습니다.";
        String goPage = "storeImg";

        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
    }
    */
    
    @PostMapping("/store/imgSave")
    public ModelAndView imgSave( 
    								@RequestParam("store_img1") MultipartFile file1,
                                    @RequestParam("store_img2") MultipartFile file2,
                                    @RequestParam("store_img3") MultipartFile file3,
                                    @RequestParam("store_img4") MultipartFile file4,
                                    @RequestParam("store_img5") MultipartFile file5) {
    	
    	//System.out.println(file1.getName());
        String fileName1 = file1.getOriginalFilename();
        String fileName2 = file2.getOriginalFilename();
        String fileName3 = file3.getOriginalFilename();
        String fileName4 = file4.getOriginalFilename();
        String fileName5 = file5.getOriginalFilename();
        //System.out.println("업로드할 파일명명: " + fileName1);
        

        // 파일 확장자 추출 (예: .jpg, .png)
        String extension1 = fileName1 != null && fileName1.contains(".") ? fileName1.substring(fileName1.lastIndexOf(".")) : "";
        String extension2 = fileName2 != null && fileName2.contains(".") ? fileName2.substring(fileName2.lastIndexOf(".")) : "";
        String extension3 = fileName3 != null && fileName3.contains(".") ? fileName3.substring(fileName3.lastIndexOf(".")) : "";
        String extension4 = fileName4 != null && fileName4.contains(".") ? fileName4.substring(fileName4.lastIndexOf(".")) : "";
        String extension5 = fileName5 != null && fileName5.contains(".") ? fileName5.substring(fileName5.lastIndexOf(".")) : "";
        

        // 시간 기반의 고유 파일명 생성 (예: 1632852643487.jpg)
        String timestamp = String.valueOf(System.currentTimeMillis());
        String fileNameWithTime1 = fileName1 + timestamp + extension1;
        String fileNameWithTime2 = fileName2 + timestamp + extension2;
        String fileNameWithTime3 = fileName3 + timestamp + extension3;
        String fileNameWithTime4 = fileName4 + timestamp + extension4;
        String fileNameWithTime5 = fileName5 + timestamp + extension5;

        // 파일이 저장될 디렉토리 경로
        //String uploadDir = "/path/to/upload/directory/";
    	String uploadDir = filePath;

    	/*
        try {
            // 파일 저장 처리 (경로만 저장)
            String filePath1 = uploadFile(file1, uploadDir, fileNameWithTime1);
            String filePath2 = uploadFile(file2, uploadDir, fileNameWithTime2);
            String filePath3 = uploadFile(file3, uploadDir, fileNameWithTime3);
            String filePath4 = uploadFile(file4, uploadDir, fileNameWithTime4);
            String filePath5 = uploadFile(file5, uploadDir, fileNameWithTime5);

            // DTO 객체에 파일 경로 설정
            StoreImgDTO storeImgDTO = new StoreImgDTO();
            storeImgDTO.setStore_img1(filePath1);
            storeImgDTO.setStore_img2(filePath2);
            storeImgDTO.setStore_img3(filePath3);
            storeImgDTO.setStore_img4(filePath4);
            storeImgDTO.setStore_img5(filePath5);

            // 이 DTO를 DB에 저장하거나 적절히 처리
            // storeImgService.save(storeImgDTO);

            System.out.println("파일 업로드 성공");
        } catch (IOException e) {
        	System.out.println("파일 업로드 실패: " + e.getMessage());
        }
        */
    
        /*
        int result = service.storeImgInsert(dto);
        //저장시키려면 메서드를? 다 하나하나 보내주면 될 것 같은데

        String msg = result > 0 ? "이미지 등록 완료되었습니다." : "이미지가 등록되지 않았습니다.";
        */

        String msg = "이미지 등록 진행중.";
        String goPage = "storeImg";
    
    
        ModelAndView mav = new ModelAndView();
        mav.addObject("msg", msg);
        mav.addObject("goPage", goPage);
        mav.setViewName("store/common/basicMsg");

        return mav;
        
        
    }
    
    /*
    private String uploadFile(MultipartFile file, String uploadDir, String filename) throws IOException {
        
        System.out.println("업로드 디렉토리: " + uploadDir);
        System.out.println("업로드할 파일: " + file);
        System.out.println("업로드할 파일명명: " + filename);
        
        String timestamp = String.valueOf(System.currentTimeMillis());        
        Path path = Paths.get(uploadDir, filename);

        if (!Files.exists(Paths.get(uploadDir))) {
            Files.createDirectories(Paths.get(uploadDir));
        }
        Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
        return path.toString(); 
    }
    */
}

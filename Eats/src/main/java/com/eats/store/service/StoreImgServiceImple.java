package com.eats.store.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.eats.mapper.store.StoreImgMapper;
import com.eats.store.model.StoreImgDTO;

@Service
public class StoreImgServiceImple implements StoreImgService {
	
	@Autowired
	private StoreImgMapper mapper;
    //private String filePath = "C:/Users/userName/saveFolder"; // 업로드할 디렉토리 경로, imgController 값과 맞춰주기!!
    private final String filePath = "C:/EATS/Eats/src/main/webapp/storeUploadImg/";

	@Override
	public int storeImgInsert(StoreImgDTO dto) {
		int count = mapper.storeImgInsert(dto);
		return count;
	}
	
	@Override
	public StoreImgDTO storeImgData() {

		StoreImgDTO data = mapper.storeImgData();
		return data;
		
		
	}
	
	
	/*
    @Override
    public String saveProfileImage(MultipartFile profileImage) throws IOException {
        if (profileImage.isEmpty()) {
            throw new IllegalArgumentException("Profile image is empty. 이미지 파일이 비어 있습니다.");
        }

        // UUID로 파일명 변환
        String saveImgFileName = ImgContUpload.fileNameConvert(profileImage.getOriginalFilename());
        String fullPath = filePath + saveImgFileName;

        try {
            profileImage.transferTo(new File(fullPath));
        } catch (IOException e) {
            throw new IOException("Failed to save profile image.", e);
        }

        return fullPath;  // 저장된 파일의 전체 경로 반환
        
        */
        
        /*
        // 파일 이름 변환 (UUID 사용하여 파일 이름 중복 방지)
        String originalFilename = profileImage.getOriginalFilename();
        String extension = originalFilename != null && originalFilename.contains(".") 
                            ? originalFilename.substring(originalFilename.lastIndexOf("."))
                            : ".jpg"; // 확장자 처리

        String saveFileName = UUID.randomUUID().toString() + extension;
        String fullPath = Paths.get(filePath, saveFileName).toString();

        // 파일 저장
        File saveFile = new File(fullPath);
        profileImage.transferTo(saveFile);

        return fullPath; // 저장된 파일 경로 반환
        */
	/*
    }
    

    @Override
    public String saveCertificationFile(MultipartFile certification) throws IOException {
        if (certification.isEmpty()) {
            throw new IllegalArgumentException("Certification file is empty. 인증서 파일이 비어 있습니다.");
        }

        // UUID로 파일명 변환
        String saveCerFileName = ImgContUpload.fileNameConvert(certification.getOriginalFilename());
        String certificationFullPath = filePath + saveCerFileName;

        try {
            certification.transferTo(new File(certificationFullPath));
        } catch (IOException e) {
            throw new IOException("Failed to save certification file.", e);
        }

        return certificationFullPath;  // 저장된 파일의 전체 경로 반환
        
        
        /*
        // 파일이 비어있는지 확인
        if (certification.isEmpty()) {
            throw new IOException("");
        }

        // 파일 이름 변환 (UUID 사용하여 파일 이름 중복 방지)
        String originalFilename = certification.getOriginalFilename();
        String extension = originalFilename != null && originalFilename.contains(".") 
                            ? originalFilename.substring(originalFilename.lastIndexOf("."))
                            : ".pdf"; // 확장자 처리

        String saveFileName = UUID.randomUUID().toString() + extension;
        String fullPath = Paths.get(filePath, saveFileName).toString();

        // 파일 저장
        File saveFile = new File(fullPath);
        certification.transferTo(saveFile);

        return fullPath; // 저장된 파일 경로 반환
    }
    */
    
    
    

}


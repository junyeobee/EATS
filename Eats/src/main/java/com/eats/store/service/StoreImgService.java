package com.eats.store.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.eats.store.model.StoreImgDTO;

public interface StoreImgService {
	public int storeImgInsert(StoreImgDTO dto);
	public StoreImgDTO storeImgData();

    // 이미지 파일을 저장하는 메서드
    //String saveProfileImage(MultipartFile profileImage) throws IOException;

    // 인증서 파일을 저장하는 메서드
    //String saveCertificationFile(MultipartFile certification) throws IOException;

    
    
}

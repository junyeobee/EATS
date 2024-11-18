package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.storeMenuMapper;
import com.eats.store.model.MenuDTO;
import com.eats.store.model.MenuImgDTO;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;


@Service
public class storeMenuServiceImple implements storeMenuService {

	@Autowired
	private storeMenuMapper mapper;
	


	@Override
	public List<MenuDTO> storeCateList() {
		List<MenuDTO> lists = mapper.storeCateList();
		return lists;
	}

	@Override
	public List<MenuDTO> storeMenuList(Integer idx) {
		List<MenuDTO> lists = mapper.storeMenuList(idx);
		return lists;
	}

	
	
	//메뉴등록 +이미지 
	
	@Override
	public int insertMenu(MenuDTO menuDTO, MultipartFile menuImg,String realpath) {
       try {
        if (menuImg != null && !menuImg.isEmpty()) {
        	
            String fileName = System.currentTimeMillis() + "_" + menuImg.getOriginalFilename();
            File directory = new File(realpath);
            if (!directory.exists()) {
                directory.mkdirs(); // 디렉토리가 존재하지 않으면 생성
            }
            String filePath = realpath + "img/" +fileName;
            System.out.println(filePath);
            menuImg.transferTo(new File(filePath)); 

            menuDTO.setMenu_img(fileName); 
        }
       }catch(Exception e) {
    	   e.printStackTrace();
       }

      
        return mapper.insertMenu(menuDTO);
    }
		
	
	@Override
	public int deleteMenuCate(String cateName) {
		int result = mapper.deleteMenuCate(cateName);
		return result;
	}

	@Override
	public int insertCate(String cateName) {
		int result = mapper.insertCate(cateName);
		return result;
	}

	@Override
	public int deleteMenu(List<Integer> menuIdx) {
		int result = mapper.deleteMenu(menuIdx);
		return result;
	}
	
	
	//메뉴 수정
	@Override
	public int updateMenu(MenuDTO dto,MultipartFile menuImg,String realpath, String oldFileName) throws IOException {
		
	    try {
	        // 새로운 이미지가 업로드된 경우
	        if (menuImg != null && !menuImg.isEmpty()) {
	            // 이미지 파일명 생성
	            String fileName = System.currentTimeMillis() + "_" + menuImg.getOriginalFilename();
	            File directory = new File(realpath + "img/");
	            if (!directory.exists()) {
	                directory.mkdirs(); // 디렉토리가 존재하지 않으면 생성
	            }

	            String filePath = realpath + "img/" + fileName;
	            menuImg.transferTo(new File(filePath)); // 이미지 파일 저장

	            // 기존 이미지 삭제
	            if (oldFileName != null && !oldFileName.isEmpty()) {
	                File oldFile = new File(realpath + "img/" + oldFileName);
	                if (oldFile.exists()) {
	                    oldFile.delete(); // 기존 이미지 삭제
	                }
	            }

	            // DTO에 새로운 파일명 설정
	            dto.setMenu_img(fileName);
	        } else {
	            // 이미지가 업로드되지 않은 경우, 기존 이미지 유지
	            dto.setMenu_img(oldFileName);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0; // 오류 발생 시 0 반환
	    }

	    // 메뉴 정보 업데이트
	    return mapper.updateMenu(dto); // mapper를 사용하여 메뉴 정보 업데이트
	}

	

	
	
	@Override
	public MenuDTO updateMenuInfo(Integer menuIdx) {
		
		MenuDTO info= mapper.updateMenuInfo(menuIdx);
		
		
		return info;
	}

}

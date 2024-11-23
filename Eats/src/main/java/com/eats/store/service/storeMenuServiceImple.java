package com.eats.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.storeMenuMapper;
import com.eats.store.model.MenuDTO;
import com.eats.store.model.MenuImgDTO;

import org.springframework.web.bind.annotation.RequestParam;
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
            
            String filePath = realpath + "img/menu/" +fileName;
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
	public int deleteMenuCate(int idx) {
		int result = mapper.deleteMenuCate(idx);
		return result;
	}

	@Override
	public int insertCate(int storeIdx, String cateName, String mCateInfo) {
		int result = mapper.insertCate(storeIdx, cateName, mCateInfo);
		return result;
	}

	@Override
	public int deleteMenu(List<Integer> menuIdx) {
		int result = mapper.deleteMenu(menuIdx);
		return result;
	}
	
	
	//메뉴 수정
	@Override
	public int updateMenu(MenuDTO dto) {
		
	    // 메뉴 정보 업데이트
	    return mapper.updateMenu(dto); 
	}

	

	
	
	@Override
	public MenuDTO updateMenuInfo(Integer menuIdx) {
		
		MenuDTO info= mapper.updateMenuInfo(menuIdx);
		
		return info;
	}

}

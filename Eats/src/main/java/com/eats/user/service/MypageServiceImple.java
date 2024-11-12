package com.eats.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eats.mapper.user.MypageMapper;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;

import java.util.List;

@Service
public class MypageServiceImple implements MypageService {

    @Autowired
    private MypageMapper mapper; // MypageMapper 주입

    @Override
    public EatsUserDTO getUserProfile(int userId) {
        return mapper.getUserProfile(userId);
    }

    @Override
    public boolean updateUserProfile(EatsUserDTO userProfile) {
        int result = mapper.updateUserProfile(userProfile); // 매퍼 호출
        return result > 0; // 업데이트 성공 여부 반환
    }

    @Override
    public List<JjimDTO> getJjimList(int userId) {
        return mapper.getJjimList(userId);
    }

    @Override
    public void deleteJjim(int userId, int storeId) {
        mapper.deleteJjim(userId, storeId);
    }

    @Override
    public List<JjimDTO> getJjimListWithPaging(int userId, int page, int itemsPerPage) {
        int offset = (page - 1) * itemsPerPage;
        return mapper.getJjimListWithPaging(userId, offset, itemsPerPage);
    }

    @Override
    public int getJjimCount(int userId) {
        return mapper.getJjimCount(userId);
    }

    @Override
    @Transactional
    public void updateProfileImage(int userId, String imagePath) {
        // 프로필 이미지 업데이트를 위한 매퍼 호출
        mapper.updateProfileImage(userId, imagePath);
    }
}

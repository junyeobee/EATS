package com.eats.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eats.mapper.user.MypageMapper;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.ReviewDTO;

import java.util.List;

@Service
public class MypageServiceImple implements MypageService {

    @Autowired
    private MypageMapper mapper; // MypageMapper 주입

    @Override
    public EatsUserDTO getUserProfile(int userId) {
        return mapper.getUserProfile(userId); // 사용자 프로필 정보 가져오기
    }

    @Override
    public boolean updateUserProfile(EatsUserDTO userProfile) {
        int result = mapper.updateUserProfile(userProfile); // 사용자 정보 업데이트
        return result > 0; // 업데이트 성공 여부 반환
    }

    @Override
    public List<JjimDTO> getJjimList(int userId) {
        return mapper.getJjimList(userId); // 전체 찜 목록 가져오기
    }

    @Override
    public void deleteJjim(int userId, int storeId) {
        mapper.deleteJjim(userId, storeId); // 찜 삭제
    }

    @Override
    public List<JjimDTO> getJjimListWithPaging(int userId, int page, int itemsPerPage) {
        int offset = (page - 1) * itemsPerPage; // 페이징을 위한 offset 계산
        return mapper.getJjimListWithPaging(userId, offset, itemsPerPage); // 페이징된 찜 목록 가져오기
    }

    @Override
    public int getJjimCount(int userId) {
        return mapper.getJjimCount(userId); // 찜 개수 가져오기
    }

    @Override
    @Transactional
    public void updateProfileImage(int userId, String imagePath) {
        mapper.updateProfileImage(userId, imagePath); // 프로필 이미지 업데이트
    }

    // 추가된 리뷰 관련 메서드
    @Override
    public int getReviewCount(int userId) {
        return mapper.getReviewCount(userId); // 총 리뷰 개수 가져오기
    }

    @Override
    public List<ReviewDTO> getReviewListWithPaging(int userId, int page, int itemsPerPage) {
        int offset = (page - 1) * itemsPerPage; // 페이징을 위한 offset 계산
        return mapper.getReviewListWithPaging(userId, offset, itemsPerPage); // 페이징된 리뷰 목록 가져오기
    }
}

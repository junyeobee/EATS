package com.eats.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.user.MypageMapper;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.EatsUserProfileDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.PaymentDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.model.UserQnaDTO;

@Service
public class MypageServiceImple implements MypageService {

    @Autowired
    private MypageMapper mypageMapper;

    @Override
    public EatsUserDTO getUserProfile(int user_idx) {
        return mypageMapper.getUserProfile(user_idx);
    }

    @Override
    public EatsUserProfileDTO getUserProfile1(int user_idx) {
        return mypageMapper.getUserProfile1(user_idx);
    }

    @Override
    public EatsUserProfileDTO getUserProfileDetail(int user_idx) {
        return mypageMapper.getUserProfileDetail(user_idx);
    }

    @Override
    public EatsUserProfileDTO getEditProfile(int user_idx) {
        return mypageMapper.getEditProfile(user_idx);
    }

    @Override
    public boolean updateUserProfile(EatsUserProfileDTO userProfile) {
        int result = mypageMapper.updateUserProfile(userProfile);
        return result > 0; // 업데이트 성공 여부 반환
    }

    // 찜 목록 (매장 이미지 포함)
    @Override
    public List<JjimDTO> getJjimList(int user_idx, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        // 찜 목록에 매장 이미지 추가
        return mypageMapper.getJjimList(user_idx, offset, pageSize);
    }

    // 찜 총 개수
    @Override
    public int getTotalJjimCount(int user_idx) {
        return mypageMapper.getTotalJjimCount(user_idx);
    }

    // 찜 삭제
    @Override
    public void deleteJjim(int user_idx, int store_idx) {
        mypageMapper.deleteJjim(user_idx, store_idx);
    }

    @Override
    public List<ReviewDTO> getReviewList(int user_idx, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return mypageMapper.getReviewList(user_idx, offset, pageSize);
    }

    @Override
    public int getTotalReviewCount(int user_idx) {
        return mypageMapper.getTotalReviewCount(user_idx); // 변환 불필요
    }

    // 결제 내역
    @Override
    public List<PaymentDTO> getPaymentList(int user_idx, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return mypageMapper.getPaymentList(user_idx, offset, pageSize);
    }

    @Override
    public int getTotalPaymentCount(int user_idx) {
        return mypageMapper.getTotalPaymentCount(user_idx);
    }

    @Override
    public EatsUserProfileDTO getUserProfile1(Integer user_idx) {
        return mypageMapper.getUserProfile1(user_idx);
    }

    @Override
    public List<UserQnaDTO> searchUserQnaList(int user_idx, String keyword, String status, int offset, int pageSize) {
        return mypageMapper.selectUserQnaList(user_idx, keyword, status, offset, pageSize);
    }

    @Override
    public int getTotalQnaCount(int user_idx, String keyword, String status) {
        return mypageMapper.getTotalQnaCount(user_idx, keyword, status);
    }

    @Override
    public boolean saveUserQna(UserQnaDTO userQna) {
        int result = mypageMapper.insertUserQna(userQna);
        return result > 0; // 성공 여부 반환
    }

    @Override
    public UserQnaDTO getQnaDetail(int uqnaIdx) {
        return mypageMapper.selectQnaDetail(uqnaIdx);
    }

    @Override
    public List<UserQnaDTO> getUserQnaList(Integer userIdx) {
        return null; // 필요에 따라 수정
    }
}

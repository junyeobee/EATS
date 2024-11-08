package com.eats.user.service;

import com.eats.mapper.user.MypageMapper;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.ReservePayDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.model.UserQnaDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MypageServiceImple implements MypageService {

    @Autowired
    private MypageMapper mypageMapper;

    @Override
    public EatsUserDTO getUserProfile(int userId) {
        return mypageMapper.getUserProfile(userId);
    }

    @Override
    public List<JjimDTO> getUserJjimList(int userId) {
        return mypageMapper.getUserJjimList(userId);
    }

    @Override
    public List<ReviewDTO> getUserReviews(int userId) {
        return mypageMapper.getUserReviews(userId);
    }

    @Override
    public List<ReservePayDTO> getUserPayments(int userId) {
        return mypageMapper.getUserPayments(userId);
    }

    @Override
    public List<UserQnaDTO> getUserQnaList(int userId) {
        return mypageMapper.getUserQnaList(userId);
    }
}

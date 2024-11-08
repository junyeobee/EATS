package com.eats.user.service;

import com.eats.mapper.user.MypageMapper;
import com.eats.user.model.EatsUserDTO;
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


}

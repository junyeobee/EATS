package com.eats.user.service;

import com.eats.user.model.EatsUserDTO;


import java.util.List;

public interface MypageService {
    EatsUserDTO getUserProfile(int userId);
}

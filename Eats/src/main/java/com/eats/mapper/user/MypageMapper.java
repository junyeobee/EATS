package com.eats.mapper.user;

import com.eats.user.model.EatsUserDTO;


import java.util.List;

public interface MypageMapper {
    EatsUserDTO getUserProfile(int userId);
}

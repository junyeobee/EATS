package com.eats.mapper.user;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.ReviewDTO;
import com.eats.user.model.ReservePayDTO;
import com.eats.user.model.UserQnaDTO;

import java.util.List;

public interface MypageMapper {
    EatsUserDTO getUserProfile(int userId);
    List<JjimDTO> getUserJjimList(int userId);
    List<ReviewDTO> getUserReviews(int userId);
    List<ReservePayDTO> getUserPayments(int userId);
    List<UserQnaDTO> getUserQnaList(int userId);
}

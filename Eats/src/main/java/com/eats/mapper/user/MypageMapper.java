package com.eats.mapper.user;
import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;

import java.util.List;

public interface MypageMapper {
    EatsUserDTO getUserProfile(int userId);
    int updateUserProfile(EatsUserDTO userProfile);
    List<JjimDTO> getJjimList(int userId);
    List<JjimDTO> getJjimListWithPaging(int userId, int offset, int limit);
    void deleteJjim(int userId, int storeId);
    int getJjimCount(int userId);
}

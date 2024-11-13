package com.eats.mapper.user;

import com.eats.user.model.EatsUserDTO;
import com.eats.user.model.JjimDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MypageMapper {
    EatsUserDTO getUserProfile(int userId); // 사용자 프로필 정보 가져오기
    int updateUserProfile(EatsUserDTO userProfile); // 사용자 프로필 정보 업데이트
    List<JjimDTO> getJjimList(int userId); // 찜 목록 가져오기
    List<JjimDTO> getJjimListWithPaging(@Param("userId") int userId, @Param("offset") int offset, @Param("limit") int limit); // 페이징된 찜 목록 가져오기
    void deleteJjim(@Param("userId") int userId, @Param("storeId") int storeId); // 찜 삭제
    int getJjimCount(int userId); // 찜 개수 가져오기
    void updateProfileImage(@Param("userId") int userId, @Param("imagePath") String imagePath); // 프로필 이미지 업데이트
}

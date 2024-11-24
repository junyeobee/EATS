package com.eats.admin.service;

import com.eats.admin.model.AdminStoreQnaDTO;
import com.eats.admin.model.AdminUserQnaDTO;

import java.util.List;

public interface AdminQnaService {
    List<AdminUserQnaDTO> getUserQnaList(String searchKeyword, int page, int size, String sortBy, String order);
    List<AdminStoreQnaDTO> getStoreQnaList(String searchKeyword, int page, int size, String sortBy, String order);
    int getUserQnaCount(String searchKeyword);
    int getStoreQnaCount(String searchKeyword);
    AdminUserQnaDTO getUserQnaDetail(int uqnaIdx);
    AdminStoreQnaDTO getStoreQnaDetail(int sqnaIdx);
    void replyToUserQna(int uqnaIdx, String answer);
    void replyToStoreQna(int sqnaIdx, String answer);
}

package com.eats.admin.service;

import com.eats.admin.model.AdminStoreQnaDTO;
import com.eats.admin.model.AdminUserQnaDTO;
import com.eats.mapper.admin.AdminQnaMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminQnaServiceImple implements AdminQnaService {

    private final AdminQnaMapper adminQnaMapper;

    public AdminQnaServiceImple(AdminQnaMapper adminQnaMapper) {
        this.adminQnaMapper = adminQnaMapper;
    }

    @Override
    public List<AdminUserQnaDTO> getUserQnaList(String searchKeyword, int page, int size, String sortBy, String order) {
        int offset = (page - 1) * size;
        return adminQnaMapper.findUserQnaList(searchKeyword, size, offset, sortBy, order);
    }

    @Override
    public List<AdminStoreQnaDTO> getStoreQnaList(String searchKeyword, int page, int size, String sortBy, String order) {
        int offset = (page - 1) * size;
        return adminQnaMapper.findStoreQnaList(searchKeyword, size, offset, sortBy, order);
    }

    @Override
    public int getUserQnaCount(String searchKeyword) {
        return adminQnaMapper.getUserQnaCount(searchKeyword);
    }

    @Override
    public int getStoreQnaCount(String searchKeyword) {
        return adminQnaMapper.getStoreQnaCount(searchKeyword);
    }

    @Override
    public AdminUserQnaDTO getUserQnaDetail(int uqnaIdx) {
        return adminQnaMapper.findUserQnaById(uqnaIdx);
    }

    @Override
    public AdminStoreQnaDTO getStoreQnaDetail(int sqnaIdx) {
        return adminQnaMapper.findStoreQnaById(sqnaIdx);
    }

    @Override
    public void replyToUserQna(int uqnaIdx, String answer) {
        adminQnaMapper.updateUserQnaReply(uqnaIdx, answer);
    }

    @Override
    public void replyToStoreQna(int sqnaIdx, String answer) {
        adminQnaMapper.updateStoreQnaReply(sqnaIdx, answer);
    }
}

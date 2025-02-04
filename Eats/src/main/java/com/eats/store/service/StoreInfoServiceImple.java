package com.eats.store.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.StoreInfoMapper;
import com.eats.store.model.CategoryDTO;
import com.eats.store.model.HYMenuCateDTO;
import com.eats.store.model.HYMenuDTO;
import com.eats.store.model.HYStoreDTO;
import com.eats.store.model.HYStoreImgDTO;
import com.eats.store.model.HYStoreInfoDTO;
import com.eats.store.model.HYStoreNewsDTO;
import com.eats.store.model.StoreTimeDTO;
import com.eats.user.model.JjimDTO;
import com.eats.user.model.ReviewDTO;

import jakarta.servlet.http.HttpSession;

@Service
public class StoreInfoServiceImple implements StoreInfoService {

	@Autowired
	private StoreInfoMapper mapper;
	
	@Override
	public HYStoreInfoDTO getStoreTotalInfo(int store_idx) {
		
		HYStoreDTO storeDto=mapper.getStoreInfo(store_idx);
		List<HYStoreImgDTO> imgList=mapper.getStoreImg(store_idx);
		
		LocalDate now=LocalDate.now();
		DayOfWeek dayOfWeek=now.getDayOfWeek();
		String days[] = {"월", "화", "수", "목", "금", "토", "일"};
		String korToday=days[dayOfWeek.getValue()-1];
		
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("store_idx", store_idx);
		param.put("kor_today", korToday);
		
		StoreTimeDTO todayTime=mapper.getTodayTime(param);
		List<StoreTimeDTO> timeList=mapper.getStoreTime(store_idx);
		List<HYStoreNewsDTO> newsList=mapper.getStoreNews(store_idx);
		List<CategoryDTO> conv_list=mapper.getStoreConvinient(store_idx);
		List<HYMenuCateDTO> menu_cate_list=mapper.getStoreMenuCate(store_idx);
		List<HYMenuDTO> menu_list=mapper.getStoreMenu(store_idx);
		int jjimCnt=mapper.getJjimCnt(store_idx);
		int revCount=mapper.getRevCount(store_idx);
		double avgRevScore=mapper.getAvgRevScore(store_idx);
		List<String> foodType=mapper.getFoodType(store_idx);
		HYStoreInfoDTO storeTotalInfo=new HYStoreInfoDTO(storeDto, imgList, todayTime, timeList, newsList, conv_list, menu_cate_list, menu_list, jjimCnt, avgRevScore, revCount, foodType);
		
		return storeTotalInfo;
	}

	@Override
	public boolean checkJjim(int user_idx, int store_idx) {
		
		JjimDTO dto=new JjimDTO(user_idx, store_idx);
		boolean isJjimed = mapper.checkJjim(dto)>0?true:false;
		
		return isJjimed;
	}
	
	@Override
	public boolean insertJjim(JjimDTO dto) {
		
		boolean result=mapper.insertJjim(dto)>0 ? true:false;
		return result;
	}
	
	@Override
	public boolean deleteJjim(JjimDTO dto) {

		boolean result=mapper.deleteJjim(dto)>0? true:false;
		return result;
	}
	
	@Override
	public int getJjimCnt(int store_idx) {
		
		int jjimCnt=mapper.getJjimCnt(store_idx);
		return jjimCnt;
	}
	
	@Override
	public Map getStoreBriefInfo(int store_idx) {
		
		Map map=mapper.getStoreBriefInfo(store_idx);
		return map;
	}
	
	@Override
	public List<Map<String, Object>> getReviewList(int store_idx) {
		List<Map<String, Object>> revDto = mapper.getReviewList(store_idx);
		return revDto;
	}
	
	@Override
	public List<HYMenuDTO> getRevMenuList(List<Integer> list) {
		List<HYMenuDTO> revMenuList=mapper.getRevMenuList(list);
		return revMenuList;
	}
	
	@Override
	public double getAvgRevScore(int store_idx) {
		double avg = mapper.getAvgRevScore(store_idx);
		return avg;
	}
	
	@Override
	public int getRevCount(int store_idx) {
		int revCnt = mapper.getRevCount(store_idx);
		return revCnt;
	}
	
	@Override
	public List<Map<String, Object>> getSortedReviewList(int store_idx, String sortType) {
        Map<String, Object> params = new HashMap<>();
        params.put("store_idx", store_idx);
        params.put("sortType", sortType);
        return mapper.getSortedReviewList(params);
    }
}

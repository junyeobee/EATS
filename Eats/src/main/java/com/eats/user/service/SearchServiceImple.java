package com.eats.user.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eats.admin.model.SearchDTO;
import com.eats.mapper.user.MainMapper;
import com.eats.mapper.user.SearchMapper;
import com.eats.store.model.HYStoreDTO;
import com.eats.store.model.StoreDTO;
import com.eats.user.model.CateKeyDTO;

@Service
public class SearchServiceImple implements SearchService {

	@Autowired
	private SearchMapper mp;
	@Autowired
	private MainMapper mm;

	@Override
	public int addSearchWord(String searchWord) {
		int count = mp.addSearchWord(searchWord);
		return count;
	}

	@Override
	public int getSearchCount(String searchWord) {
		int count = mp.getSearchCount(searchWord);
		return count;
	}

	@Override
	public int addCount(String searchWord) {
		int count = mp.addCount(searchWord);
		return count;
	}

	@Override
	public List<SearchDTO> getSearchData(Map<String, String> dateMap) {
		List<SearchDTO> list = mp.getSearchData(dateMap);
		return list;
	}

	@Override
	public Map<String, Integer> getSearchCountByTag(List<String> valueList, Map<String, String> dateMap) {
		Map<String, Object> newmap = new HashMap<>();
		newmap.put("valueList", valueList);
		newmap.put("first_date", dateMap.get("first_date"));
		newmap.put("last_date", dateMap.get("last_date"));

		List<SearchDTO> dtoList = mp.getSearchCountByTag(newmap);

		Map<String, Integer> countMap = new HashMap<>();
		for (String value : valueList) {
			int count = 0;
			for (SearchDTO dto : dtoList) {
				if (dto.getSearch_word().contains(value)) {
					count += dto.getSearch_count();
				}
			}
			countMap.put(value, count);
		}

		return countMap;
	}

	@Override
	public List<HYStoreDTO> getStoreInfo(Map<String, Object> map) {
		String selectedTime = (String) map.get("time");
		String selectedDate = (String) map.get("date");
		String selectedPrice = (String) map.get("price");
		String word = (String)map.get("word");

		String week = null;
		if (selectedDate != null && !selectedDate.equals("")) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate date = LocalDate.parse(selectedDate, formatter);

			// 요일을 숫자로 구하기 (1=월요일, 7=일요일)
			int weekNumber = date.getDayOfWeek().getValue();
			switch (weekNumber) {
			case 1:
				week = "월";
				break;
			case 2:
				week = "화";
				break;
			case 3:
				week = "수";
				break;
			case 4:
				week = "목";
				break;
			case 5:
				week = "금";
				break;
			case 6:
				week = "토";
				break;
			case 7:
				week = "일";
				break;
			}
		}

		map.put("week", week);

		List<HYStoreDTO> storeList = mp.getStoreInfo(map);

		if (selectedTime != null && !selectedTime.equals("")) {
			for (int i = 0; i < storeList.size(); i++) {
				String[] breakTime = storeList.get(i).getStime_break().split("-");

				int bshour = Integer.parseInt(breakTime[0].split(":")[0]);
				int bsmin = Integer.parseInt(breakTime[0].split(":")[1]);
				int behour = Integer.parseInt(breakTime[1].split(":")[0]);
				int bemin = Integer.parseInt(breakTime[1].split(":")[1]);

				int selectedHour = Integer.parseInt(selectedTime.split(":")[0]);
				int selectedMin = Integer.parseInt(selectedTime.split(":")[1]);

				if (selectedHour > bshour && selectedHour < behour) {
					storeList.remove(i);
					i--;
				} else if (selectedHour == bshour && selectedMin >= bsmin) {
					storeList.remove(i);
					i--;
				} else if (selectedHour == behour && selectedMin <= bemin) {
					storeList.remove(i);
					i--;
				}
			}
		}

		if (storeList.size() > 0) {
			if (selectedPrice != null && !selectedPrice.equals("")) {
				for (int i = 0; i < storeList.size(); i++) {
					String[] prices = selectedPrice.split(",");
					int minPrice = Integer.parseInt(prices[0]);
					int maxPrice = Integer.parseInt(prices[1]);

					if (storeList.get(i).getAvg_price() < minPrice || storeList.get(i).getAvg_price() > maxPrice) {
						storeList.remove(i);
						i--;
					}
				}
			}
		}
		
		if(storeList.size()>0) {
			for(HYStoreDTO dto:storeList) {
				Map<String,Object> daymap = new HashMap<>();
				daymap.put("store_idx", dto.getStore_idx());
				daymap.put("week", week);
				
				if(mp.getStoreStimeDay(daymap)==0) {
					dto.setStime_start(week+" 휴무");
				}
			}
		}
		
		return storeList;
	}
	
	@Override
	public int getStoreStimeDay(Map<String, Object> map) {
		int count = mp.getStoreStimeDay(map);
		return count;
	}
}

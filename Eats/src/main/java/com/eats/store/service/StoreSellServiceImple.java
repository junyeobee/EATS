package com.eats.store.service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.eats.mapper.store.SalesMapper;
import com.eats.store.model.SalesSaveDTO;
import com.eats.store.model.SellsDetailDTO;

@Service
public class StoreSellServiceImple implements StoreSellService {
	@Autowired
	private  SalesMapper mapper;
	   
	@Override
	@Transactional
	public int sellInsert(MultipartFile file, int storeIdx) throws RuntimeException {
		if (file == null || file.isEmpty()) {
			throw new IllegalArgumentException("파일이 비어있습니다.");
		}
	
		List<String[]> rows;
		try {
			rows = parseCsvFile(file);
		} catch (IOException e) {
			throw new RuntimeException("파일 읽기 실패: " + e.getMessage());
		}
	
		int successCount = 0;
	
		for (String[] row : rows) {
			try {
				if (row.length < 4) {
					throw new IllegalArgumentException("데이터 형식이 올바르지 않습니다.");
			}
	    
				SalesSaveDTO salesDTO = new SalesSaveDTO();
				salesDTO.setStoreIdx(storeIdx);
	    
				try {
					salesDTO.setSellDate(parseSellDate(row[0]));
				} catch (ParseException e) {
					throw new IllegalArgumentException("날짜 형식이 올바르지 않습니다: " + row[0]);
				}
	    
				salesDTO.setSellMethod(validatePaymentMethod(row[1]));
	    
				try {
					salesDTO.setTotalCnt(Integer.parseInt(row[2]));
				} catch (NumberFormatException e) {
					throw new IllegalArgumentException("주문수량이 올바르지 않습니다: " + row[2]);
				}
	    
				List<SellsDetailDTO> details = new ArrayList<>();
				for (int i = 4; i < row.length; i += 3) {
					if (i + 2 >= row.length) {
						throw new IllegalArgumentException("메뉴 데이터가 불완전합니다.");
					}
	        
					SellsDetailDTO detail = new SellsDetailDTO();
					try {
						detail.setMenuIdx(Integer.parseInt(row[i]));
						detail.setOrderNum(Integer.parseInt(row[i + 1]));
					} catch (NumberFormatException e) {
						throw new IllegalArgumentException("메뉴 정보가 올바르지 않습니다: 행 " + (i/3 + 1));
					}
					details.add(detail);
				}
				salesDTO.setDetails(details);
	    
				int result = mapper.insertSalesWithDetails(salesDTO);
				if (result > 0) {
					successCount++;
				}
	    
			} catch (IllegalArgumentException e) {
				throw new RuntimeException((successCount + 1) + "번째 행 처리 중 오류: " + e.getMessage());
			} catch (Exception e) {
				throw new RuntimeException((successCount + 1) + "번째 행 처리 중 예상치 못한 오류 발생");
	        }
	    }
	    
	    return successCount;
	}
	
	private List<String[]> parseCsvFile(MultipartFile file) throws IOException {
	    try (BufferedReader reader = new BufferedReader(
	            new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8))) {
	        return reader.lines()
	                .skip(1)
	                .map(line -> line.split(","))
	                .collect(Collectors.toList());
	    }
	}
	
	private Date parseSellDate(String dateStr) throws ParseException {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	return sdf.parse(dateStr);
	}
	
	private String validatePaymentMethod(String method) {
	    List<String> validMethods = List.of("CARD", "CASH", "KAKAOPAY", "NAVERPAY");
	    if (!validMethods.contains(method.toUpperCase())) {
	    	throw new IllegalArgumentException("올바르지 않은 결제 방식: " + method);
	    }
	    return method.toUpperCase();
	}
}
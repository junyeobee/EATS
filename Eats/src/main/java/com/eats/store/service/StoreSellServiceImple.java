package com.eats.store.service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.eats.mapper.store.SalesMapper;
import com.eats.store.model.SalesResponseDTO;
import com.eats.store.model.SalesSaveDTO;
import com.eats.store.model.SalesSearchDTO;

@Service
public class StoreSellServiceImple implements StoreSellService {
	@Autowired
	private SalesMapper mapper;
	   
	@Override
	@Transactional
	public int sellInsert(MultipartFile file, int storeIdx) throws RuntimeException {
	   if (file == null || file.isEmpty()) {
	       throw new IllegalArgumentException("파일이 비어있습니다.");
	   }

	   List<String[]> rows;
	   try {
	       rows = parseCsvFile(file);
	       System.out.println("Total rows parsed: " + rows.size());
	   } catch (IOException e) {
	       throw new RuntimeException("파일 읽기 실패: " + e.getMessage());
	   }

	   int successCount = 0;

	   for (String[] row : rows) {
	       try {
	           if (row.length < 4) {
	               throw new IllegalArgumentException("데이터 형식이 올바르지 않습니다.");
	           }

	           // SELL 테이블에 먼저 입력
	           SalesSaveDTO salesDTO = new SalesSaveDTO();
	           salesDTO.setStoreIdx(storeIdx);

	           try {
	               salesDTO.setSellDate(parseSellDate(row[0]));
	           } catch (ParseException e) {
	               throw new IllegalArgumentException("날짜 형식이 올바르지 않습니다: " + row[0]);
	           }

	           salesDTO.setSellMethod(validatePaymentMethod(row[1]));
	           salesDTO.setTotalCnt(Integer.parseInt(row[3]));

	           int result = mapper.insertSell(salesDTO); // SELL 테이블 insert

	           if(result > 0) {
	               // SELL_DETAIL 테이블에 입력
	               for (int i = 4; i < row.length; i += 3) {
	                   if (i + 2 >= row.length) {
	                       throw new IllegalArgumentException("메뉴데이터없음");
	                   }

	                   Map<String, Object> params = new HashMap<String, Object>();
	                   params.put("sellIdx", salesDTO.getSellIdx());
	                   params.put("menuIdx", Integer.parseInt(row[i]));
	                   params.put("orderNum", Integer.parseInt(row[i + 1]));

	                   mapper.insertSellDetails(params);
	               }
	               successCount++;
	           }

	           System.out.println("=== 매퍼 실행 결과 ===");
	           System.out.println("SELL_IDX: " + salesDTO.getSellIdx());
	           System.out.println("처리된 메뉴 수: " + ((row.length - 4) / 3));

	       } catch (IllegalArgumentException e) {
	           throw new RuntimeException((successCount + 1) + "번째 행 처리 중 오류: " + e.getMessage());
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
	   }

	   return successCount;
	}
	
	private List<String[]> parseCsvFile(MultipartFile file) throws IOException {
	    byte[] bytes = file.getBytes();
	    
	    //인코딩 uft-8-sig 때문에 이럼 ㅋㅋ
	    if (bytes.length >= 3 && 
	        (bytes[0] & 0xFF) == 0xEF && 
	        (bytes[1] & 0xFF) == 0xBB && 
	        (bytes[2] & 0xFF) == 0xBF) {
	        bytes = Arrays.copyOfRange(bytes, 3, bytes.length);
	    }
	    
	    try (BufferedReader reader = new BufferedReader(
	            new InputStreamReader(new ByteArrayInputStream(bytes), StandardCharsets.UTF_8))) {
	        
	        List<String[]> rows = new ArrayList<>();
	        String line;
	        boolean firstLine = true;
	        
	        while ((line = reader.readLine()) != null) {
	            if (firstLine) {
	                firstLine = false;
	                continue;
	            }
	            if (!line.trim().isEmpty()) {
	                System.out.println("Parsing line: " + line);
	                String[] fields = line.split(",");
	                System.out.println("Fields length: " + fields.length);
	                rows.add(fields);
	            }
	        }
	        return rows;
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
	
	@Override
	public List<SalesResponseDTO> sellList(SalesSearchDTO searchDTO) {
		List<SalesResponseDTO> result;
		System.out.println(searchDTO.getDateType());
		switch(searchDTO.getDateType()) {
			case "hour" : result = mapper.sellList(searchDTO);
			for(SalesResponseDTO dto : result) {
				dto.setSellDate(dto.getSellDate()+"시");
			}
			return result;
			case "1w" : result = mapper.sellListWeek(searchDTO); 
			return result;
			case "1m" : result = mapper.sellListMonth(searchDTO); 
			return result;
			case "3m" : result = mapper.sellList3Month(searchDTO);
			return result;
		}
		return null;
	}
}
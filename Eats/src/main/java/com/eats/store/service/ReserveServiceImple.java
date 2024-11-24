package com.eats.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.eats.mapper.store.ReserveMapper;
import com.eats.store.model.reserve.AlarmDTO;
import com.eats.store.model.reserve.BinTables;
import com.eats.store.model.reserve.ReserveListDTO;
import com.eats.store.model.reserve.StoreTimeDTO;
import com.eats.store.model.reserve.TableDTO;

@Service
public class ReserveServiceImple implements ReserveService {
	@Autowired
    private JavaMailSender mailSender;

	@Autowired
	private ReserveMapper mapper;
	
	@Override
	public List<TableDTO> tables(Map<String, Object> map) {
		List<TableDTO> result = mapper.tables(map);
		return result;
	}
	
	@Override
	public List<ReserveListDTO> reserveList(Map<String, Object> map) {
		List<ReserveListDTO> result = mapper.reserveList(map);
		return result;
	}

	public StoreTimeDTO storeTime(Map<String, Object> map){
		StoreTimeDTO result = mapper.storeTime(map);
		return result;
	}
	@Override
	public int assignTable(Map<String, Object> map) {
		int result = mapper.assignTable(map);
		
		return result;
	}
	@Override
	public List<BinTables> getBinTables(Map<String, Object> map) {
		List<BinTables> result = mapper.selectBinTables(map);
		return result;
	}

	@Override
	public List<AlarmDTO> getAlarmRequests(Map<String, Object> map) {
		List<AlarmDTO> result = mapper.selectAlarms(map);
		return result;
	}

	public int sendAlarm(String userEmail, String content) {
		try {
			SimpleMailMessage msg = new SimpleMailMessage();
			msg.setTo(userEmail);
			msg.setSubject("[EATS] 빈자리 알림");
			msg.setText(content);
			mailSender.send(msg);
			return 1;
		} catch(Exception e) {
			return 0;
		}
	}
}

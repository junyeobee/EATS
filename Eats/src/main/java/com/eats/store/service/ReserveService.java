package com.eats.store.service;

import java.util.List;
import java.util.Map;

import com.eats.store.model.reserve.TableDTO;

public interface ReserveService {
	public List<TableDTO> tables(Map map);
}

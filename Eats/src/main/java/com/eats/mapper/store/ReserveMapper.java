package com.eats.mapper.store;

import java.util.List;
import java.util.Map;

import com.eats.store.model.reserve.TableDTO;

public interface ReserveMapper {
	public List<TableDTO> tables(Map map);
}

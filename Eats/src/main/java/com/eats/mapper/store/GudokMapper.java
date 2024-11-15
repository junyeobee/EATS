package com.eats.mapper.store;

import java.util.Map;

import com.eats.store.model.GudokDTO;

public interface GudokMapper {
	public void insertSubscription(Map map);
	public GudokDTO getGudokInfo(int store_idx);
	public void updateInfo(Map map);
}

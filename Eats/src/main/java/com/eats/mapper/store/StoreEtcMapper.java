package com.eats.mapper.store;

import com.eats.store.model.StoreDTO;
import com.eats.store.model.StoreGridAllDTO;
import com.eats.store.model.StoreGridBaseDTO;
import com.eats.store.model.StoreGridDetailDTO;
import com.eats.store.model.StoreInfoUpdateDTO;
import com.eats.store.model.StoreNewsDTO;
import com.eats.store.model.StoreCateDTO;

import java.util.List;


public interface StoreEtcMapper {

	public StoreDTO storeData(int store_idx);
	public int StoreInfoUpdateInsert(StoreInfoUpdateDTO dto);
	public List<StoreCateDTO> storeCate(int store_idx);

	public int StoreGridBaseInsert(int store_idx, int s_floor, int sg_row, int sg_col);
	public int storeGridBaseKeySelect(int store_idx);
	
	public int StoreGridDetailInsert(StoreGridDetailDTO dto);
	public StoreGridBaseDTO storeGridBaseSelect(int store_idx);
	public List<StoreGridDetailDTO> storeGridDetailView(int sg_idx);
	
	public int StoreGridDetailDelete(int sg_idx);
	public int StoreGridBaseDelete(int sg_idx);
}

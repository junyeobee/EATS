package com.eats.admin.service;

public interface StoreEntryService {

	public int tagOneCheck(int store_idx);
	public int tagTwoCheck(int store_idx);
	public int timeCheck(int store_idx);
	public int imgCheck(int store_idx);
	
	public int storeEntryInAction(int store_idx);

}

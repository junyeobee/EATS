package com.eats.store.model.reserve;

import java.util.List;

public class ReservOkViewDTO {
	public List<TableDTO> tables;
	public List<ReserveListDTO> lists;
	
	public ReservOkViewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservOkViewDTO(List<TableDTO> tables, List<ReserveListDTO> lists) {
		this.tables = tables;
		this.lists = lists;
	}

	public List<TableDTO> getTables() {
		return tables;
	}

	public void setTables(List<TableDTO> tables) {
		this.tables = tables;
	}

	public List<ReserveListDTO> getLists() {
		return lists;
	}

	public void setLists(List<ReserveListDTO> lists) {
		this.lists = lists;
	}
	
	
}

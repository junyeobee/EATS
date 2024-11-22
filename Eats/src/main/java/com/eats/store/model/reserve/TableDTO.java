package com.eats.store.model.reserve;

public class TableDTO {
	private int table_num;
	private int cnt;
	private int stat;
	private String tableType;
	
	public TableDTO() {
		// TODO Auto-generated constructor stub
	}

	public TableDTO(int table_num, int cnt, int stat, String tableType) {
		super();
		this.table_num = table_num;
		this.cnt = cnt;
		this.stat = stat;
		this.tableType = tableType;
	}

	public int getTable_num() {
		return table_num;
	}

	public void setTable_num(int table_num) {
		this.table_num = table_num;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getStat() {
		return stat;
	}

	public void setStat(int stat) {
		this.stat = stat;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}
	
}

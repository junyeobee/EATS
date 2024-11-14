package com.eats.store.model;

public class SellDetailDTO {
	public int sell_d_idx;
	public int sell_idx;
	public int menu_idx;
	public int order_num;
	
	public SellDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public SellDetailDTO(int sell_d_idx, int sell_idx, int menu_idx, int order_num) {
		super();
		this.sell_d_idx = sell_d_idx;
		this.sell_idx = sell_idx;
		this.menu_idx = menu_idx;
		this.order_num = order_num;
	}

	public int getSell_d_idx() {
		return sell_d_idx;
	}

	public void setSell_d_idx(int sell_d_idx) {
		this.sell_d_idx = sell_d_idx;
	}

	public int getSell_idx() {
		return sell_idx;
	}

	public void setSell_idx(int sell_idx) {
		this.sell_idx = sell_idx;
	}

	public int getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	
}

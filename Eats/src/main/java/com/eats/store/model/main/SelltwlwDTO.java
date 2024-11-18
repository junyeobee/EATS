package com.eats.store.model.main;

public class SelltwlwDTO {
	private int thisweekamount;
	private int lastweekamount;
	
	public SelltwlwDTO() {
		// TODO Auto-generated constructor stub
	}

	public SelltwlwDTO(int thisweekamount, int lastweekamount) {
		super();
		this.thisweekamount = thisweekamount;
		this.lastweekamount = lastweekamount;
	}

	public int getThisweekamount() {
		return thisweekamount;
	}

	public void setThisweekamount(int thisweekamount) {
		this.thisweekamount = thisweekamount;
	}

	public int getLastweekamount() {
		return lastweekamount;
	}

	public void setLastweekamount(int lastweekamount) {
		this.lastweekamount = lastweekamount;
	}
}

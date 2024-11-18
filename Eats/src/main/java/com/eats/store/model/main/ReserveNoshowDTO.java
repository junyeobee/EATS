package com.eats.store.model.main;

public class ReserveNoshowDTO {
	private int reservestate;
	private int statecnt;
	
	public ReserveNoshowDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReserveNoshowDTO(int reservestate, int statecnt) {
		super();
		this.reservestate = reservestate;
		this.statecnt = statecnt;
	}

	public int getReservestate() {
		return reservestate;
	}

	public void setReservestate(int reservestate) {
		this.reservestate = reservestate;
	}

	public int getStatecnt() {
		return statecnt;
	}

	public void setStatecnt(int statecnt) {
		this.statecnt = statecnt;
	}
	
}

package com.eats.store.model.main;

public class ReserveReqDTO {
	private String reservetime;
	private int reservecnt;
	private String request;
	
	public ReserveReqDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReserveReqDTO(String reservetime, int reservecnt, String request) {
		super();
		this.reservetime = reservetime;
		this.reservecnt = reservecnt;
		this.request = request;
	}

	public String getReservetime() {
		return reservetime;
	}

	public void setReservetime(String reservetime) {
		this.reservetime = reservetime;
	}

	public int getReservecnt() {
		return reservecnt;
	}

	public void setReservecnt(int reservecnt) {
		this.reservecnt = reservecnt;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}
	
}

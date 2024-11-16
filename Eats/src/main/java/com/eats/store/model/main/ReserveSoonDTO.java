package com.eats.store.model.main;

public class ReserveSoonDTO {
	private String reservetime;
	private int reservecount;
	private String request;
	
	public ReserveSoonDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ReserveSoonDTO(String reservetime, int reservecount, String request) {
		super();
		this.reservetime = reservetime;
		this.reservecount = reservecount;
		this.request = request;
	}
	
	public String getReservetime() {
		return reservetime;
	}
	public void setReservetime(String reservetime) {
		this.reservetime = reservetime;
	}
	public int getReservecount() {
		return reservecount;
	}
	public void setReservecount(int reservecount) {
		this.reservecount = reservecount;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
}

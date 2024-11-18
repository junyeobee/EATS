package com.eats.store.model.main;

public class ReserveToTimeDTO {
	private String timeslot;
	private int reservationcount;
	private int guestcount;
	
	public ReserveToTimeDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReserveToTimeDTO(String timeslot, int reservationcount, int guestcount) {
		super();
		this.timeslot = timeslot;
		this.reservationcount = reservationcount;
		this.guestcount = guestcount;
	}

	public String getTimeslot() {
		return timeslot;
	}

	public void setTimeslot(String timeslot) {
		this.timeslot = timeslot;
	}

	public int getReservationcount() {
		return reservationcount;
	}

	public void setReservationcount(int reservationcount) {
		this.reservationcount = reservationcount;
	}

	public int getGuestcount() {
		return guestcount;
	}

	public void setGuestcount(int guestcount) {
		this.guestcount = guestcount;
	}
	
	
}

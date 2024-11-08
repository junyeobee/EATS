package com.eats.user.model;

public class ReservePayDTO {
    private int reserveIdx;
    private int payPrice;
    private int payMethod;
    
    public ReservePayDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservePayDTO(int reserveIdx, int payPrice, int payMethod) {
		super();
		this.reserveIdx = reserveIdx;
		this.payPrice = payPrice;
		this.payMethod = payMethod;
	}

	public int getReserveIdx() {
		return reserveIdx;
	}

	public void setReserveIdx(int reserveIdx) {
		this.reserveIdx = reserveIdx;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public int getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(int payMethod) {
		this.payMethod = payMethod;
	}
    
}

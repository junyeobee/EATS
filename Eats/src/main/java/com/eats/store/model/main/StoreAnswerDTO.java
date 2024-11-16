package com.eats.store.model.main;

public class StoreAnswerDTO {
	private String sqnatitle;
	private int sqnatype;
	private String sqnadate;
	private int sqnastat;
	
	public StoreAnswerDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreAnswerDTO(String sqnatitle, int sqnatype, String sqnadate, int sqnastat) {
		super();
		this.sqnatitle = sqnatitle;
		this.sqnatype = sqnatype;
		this.sqnadate = sqnadate;
		this.sqnastat = sqnastat;
	}

	public String getSqnatitle() {
		return sqnatitle;
	}

	public void setSqnatitle(String sqnatitle) {
		this.sqnatitle = sqnatitle;
	}

	public int getSqnatype() {
		return sqnatype;
	}

	public void setSqnatype(int sqnatype) {
		this.sqnatype = sqnatype;
	}

	public String getSqnadate() {
		return sqnadate;
	}

	public void setSqnadate(String sqnadate) {
		this.sqnadate = sqnadate;
	}

	public int getSqnastat() {
		return sqnastat;
	}

	public void setSqnastat(int sqnastat) {
		this.sqnastat = sqnastat;
	}
	
}

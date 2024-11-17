package com.eats.store.model.main;

public class GenderCntDTO {
	private int gender;
	private int visitorcnt;
	
	public GenderCntDTO() {
		// TODO Auto-generated constructor stub
	}

	public GenderCntDTO(int gender, int visitorcnt) {
		super();
		this.gender = gender;
		this.visitorcnt = visitorcnt;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getVisitorcnt() {
		return visitorcnt;
	}

	public void setVisitorcnt(int visitorcnt) {
		this.visitorcnt = visitorcnt;
	}
	
}

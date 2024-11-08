package com.eats.user.model;

import java.util.Date;

public class ReviewDTO {
    private int revIdx;
    private int reserveIdx;
    private int revScore;
    private String revContent;
    private Date revWriteDate;
    private int revState;
    
    public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int revIdx, int reserveIdx, int revScore, String revContent, Date revWriteDate, int revState) {
		super();
		this.revIdx = revIdx;
		this.reserveIdx = reserveIdx;
		this.revScore = revScore;
		this.revContent = revContent;
		this.revWriteDate = revWriteDate;
		this.revState = revState;
	}

	public int getRevIdx() {
		return revIdx;
	}

	public void setRevIdx(int revIdx) {
		this.revIdx = revIdx;
	}

	public int getReserveIdx() {
		return reserveIdx;
	}

	public void setReserveIdx(int reserveIdx) {
		this.reserveIdx = reserveIdx;
	}

	public int getRevScore() {
		return revScore;
	}

	public void setRevScore(int revScore) {
		this.revScore = revScore;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public Date getRevWriteDate() {
		return revWriteDate;
	}

	public void setRevWriteDate(Date revWriteDate) {
		this.revWriteDate = revWriteDate;
	}

	public int getRevState() {
		return revState;
	}

	public void setRevState(int revState) {
		this.revState = revState;
	}
    
}

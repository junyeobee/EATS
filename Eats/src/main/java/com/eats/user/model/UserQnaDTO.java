package com.eats.user.model;

import java.util.Date;

public class UserQnaDTO {
    private int uqnaIdx;
    private String uqnaTitle;
    private String uqnaContent;
    private Date uqnaWdate;
    private int uqnaStat;
    private String uqnaAnswer;
    
    public UserQnaDTO() {
		// TODO Auto-generated constructor stub
	}

	public UserQnaDTO(int uqnaIdx, String uqnaTitle, String uqnaContent, Date uqnaWdate, int uqnaStat,
			String uqnaAnswer) {
		super();
		this.uqnaIdx = uqnaIdx;
		this.uqnaTitle = uqnaTitle;
		this.uqnaContent = uqnaContent;
		this.uqnaWdate = uqnaWdate;
		this.uqnaStat = uqnaStat;
		this.uqnaAnswer = uqnaAnswer;
	}

	public int getUqnaIdx() {
		return uqnaIdx;
	}

	public void setUqnaIdx(int uqnaIdx) {
		this.uqnaIdx = uqnaIdx;
	}

	public String getUqnaTitle() {
		return uqnaTitle;
	}

	public void setUqnaTitle(String uqnaTitle) {
		this.uqnaTitle = uqnaTitle;
	}

	public String getUqnaContent() {
		return uqnaContent;
	}

	public void setUqnaContent(String uqnaContent) {
		this.uqnaContent = uqnaContent;
	}

	public Date getUqnaWdate() {
		return uqnaWdate;
	}

	public void setUqnaWdate(Date uqnaWdate) {
		this.uqnaWdate = uqnaWdate;
	}

	public int getUqnaStat() {
		return uqnaStat;
	}

	public void setUqnaStat(int uqnaStat) {
		this.uqnaStat = uqnaStat;
	}

	public String getUqnaAnswer() {
		return uqnaAnswer;
	}

	public void setUqnaAnswer(String uqnaAnswer) {
		this.uqnaAnswer = uqnaAnswer;
	}
    
}

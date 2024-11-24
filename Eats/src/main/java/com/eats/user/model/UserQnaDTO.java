package com.eats.user.model;

import java.sql.Date;

public class UserQnaDTO {
    private int UQNA_IDX;         // 문의 ID
    private int USER_IDX;         // 사용자 ID
    private String UQNA_TITLE;    // 문의 제목
    private String UQNA_CONTENT;  // 문의 내용
    private Date UQNA_WDATE;      // 작성일
    private int UQNA_STAT;        // 상태 (0: 미처리, 1: 처리 완료)
    private String UQNA_TYPE;     // 문의 유형
    private String UQNA_ANSWER;   // 답변 내용
    
    public UserQnaDTO() {
		// TODO Auto-generated constructor stub
	}
    
    
    // Getters and Setters
    public int getUQNA_IDX() {
        return UQNA_IDX;
    }

    public void setUQNA_IDX(int UQNA_IDX) {
        this.UQNA_IDX = UQNA_IDX;
    }

    public int getUSER_IDX() {
        return USER_IDX;
    }

    public void setUSER_IDX(int USER_IDX) {
        this.USER_IDX = USER_IDX;
    }

    public String getUQNA_TITLE() {
        return UQNA_TITLE;
    }

    public void setUQNA_TITLE(String UQNA_TITLE) {
        this.UQNA_TITLE = UQNA_TITLE;
    }

    public String getUQNA_CONTENT() {
        return UQNA_CONTENT;
    }

    public void setUQNA_CONTENT(String UQNA_CONTENT) {
        this.UQNA_CONTENT = UQNA_CONTENT;
    }

    public Date getUQNA_WDATE() {
        return UQNA_WDATE;
    }

    public void setUQNA_WDATE(Date UQNA_WDATE) {
        this.UQNA_WDATE = UQNA_WDATE;
    }

    public int getUQNA_STAT() {
        return UQNA_STAT;
    }

    public void setUQNA_STAT(int UQNA_STAT) {
        this.UQNA_STAT = UQNA_STAT;
    }

    public String getUQNA_TYPE() {
        return UQNA_TYPE;
    }

    public void setUQNA_TYPE(String UQNA_TYPE) {
        this.UQNA_TYPE = UQNA_TYPE;
    }

    public String getUQNA_ANSWER() {
        return UQNA_ANSWER;
    }

    public void setUQNA_ANSWER(String UQNA_ANSWER) {
        this.UQNA_ANSWER = UQNA_ANSWER;
    }
    
    // toString Method
    @Override
    public String toString() {
        return "UserQnaDTO{" +
                "UQNA_IDX=" + UQNA_IDX +
                ", USER_IDX=" + USER_IDX +
                ", UQNA_TITLE='" + UQNA_TITLE + '\'' +
                ", UQNA_CONTENT='" + UQNA_CONTENT + '\'' +
                ", UQNA_WDATE=" + UQNA_WDATE +
                ", UQNA_STAT=" + UQNA_STAT +
                ", UQNA_TYPE='" + UQNA_TYPE + '\'' +
                ", UQNA_ANSWER='" + UQNA_ANSWER + '\'' +
                '}';
    }
}

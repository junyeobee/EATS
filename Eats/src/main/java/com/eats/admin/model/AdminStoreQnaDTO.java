package com.eats.admin.model;

import java.util.Date;

public class AdminStoreQnaDTO {
    private int sqna_idx;         // 문의사항 ID
    private int store_idx;        // 매장 ID
    private String sqna_title;    // 문의 제목
    private String sqna_content;  // 문의 내용
    private Date sqna_wdate;      // 작성 날짜
    private int sqna_stat;        // 상태 (0: 대기, 1: 답변 완료)
    private String sqna_type;     // 문의 유형
    private String sqna_answer;   // 답변 내용

    // Getter and Setter
    public int getSqna_idx() {
        return sqna_idx;
    }

    
    public AdminStoreQnaDTO(int sqna_idx, int store_idx, String sqna_title, String sqna_content, Date sqna_wdate,
			int sqna_stat, String sqna_type, String sqna_answer) {
		super();
		this.sqna_idx = sqna_idx;
		this.store_idx = store_idx;
		this.sqna_title = sqna_title;
		this.sqna_content = sqna_content;
		this.sqna_wdate = sqna_wdate;
		this.sqna_stat = sqna_stat;
		this.sqna_type = sqna_type;
		this.sqna_answer = sqna_answer;
	}


	public void setSqna_idx(int sqna_idx) {
        this.sqna_idx = sqna_idx;
    }

    public int getStore_idx() {
        return store_idx;
    }

    public void setStore_idx(int store_idx) {
        this.store_idx = store_idx;
    }

    public String getSqna_title() {
        return sqna_title;
    }

    public void setSqna_title(String sqna_title) {
        this.sqna_title = sqna_title;
    }

    public String getSqna_content() {
        return sqna_content;
    }

    public void setSqna_content(String sqna_content) {
        this.sqna_content = sqna_content;
    }

    public Date getSqna_wdate() {
        return sqna_wdate;
    }

    public void setSqna_wdate(Date sqna_wdate) {
        this.sqna_wdate = sqna_wdate;
    }

    public int getSqna_stat() {
        return sqna_stat;
    }

    public void setSqna_stat(int sqna_stat) {
        this.sqna_stat = sqna_stat;
    }

    public String getSqna_type() {
        return sqna_type;
    }

    public void setSqna_type(String sqna_type) {
        this.sqna_type = sqna_type;
    }

    public String getSqna_answer() {
        return sqna_answer;
    }

    public void setSqna_answer(String sqna_answer) {
        this.sqna_answer = sqna_answer;
    }
}

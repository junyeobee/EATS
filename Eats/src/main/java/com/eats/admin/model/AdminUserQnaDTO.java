package com.eats.admin.model;

import java.util.Date;

public class AdminUserQnaDTO {
    private int uqna_idx;         // 문의사항 ID
    private int user_idx;         // 사용자 ID
    private String uqna_title;    // 문의 제목
    private String uqna_content;  // 문의 내용
    private Date uqna_wdate;      // 작성 날짜
    private int uqna_stat;        // 상태 (0: 대기, 1: 답변 완료)
    private String uqna_type;     // 문의 유형
    private String uqna_answer;   // 답변 내용

    // Getter and Setter
    public int getUqna_idx() {
        return uqna_idx;
    }

    
    public AdminUserQnaDTO(int uqna_idx, int user_idx, String uqna_title, String uqna_content, Date uqna_wdate,
			int uqna_stat, String uqna_type, String uqna_answer) {
		super();
		this.uqna_idx = uqna_idx;
		this.user_idx = user_idx;
		this.uqna_title = uqna_title;
		this.uqna_content = uqna_content;
		this.uqna_wdate = uqna_wdate;
		this.uqna_stat = uqna_stat;
		this.uqna_type = uqna_type;
		this.uqna_answer = uqna_answer;
	}


	public void setUqna_idx(int uqna_idx) {
        this.uqna_idx = uqna_idx;
    }

    public int getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(int user_idx) {
        this.user_idx = user_idx;
    }

    public String getUqna_title() {
        return uqna_title;
    }

    public void setUqna_title(String uqna_title) {
        this.uqna_title = uqna_title;
    }

    public String getUqna_content() {
        return uqna_content;
    }

    public void setUqna_content(String uqna_content) {
        this.uqna_content = uqna_content;
    }

    public Date getUqna_wdate() {
        return uqna_wdate;
    }

    public void setUqna_wdate(Date uqna_wdate) {
        this.uqna_wdate = uqna_wdate;
    }

    public int getUqna_stat() {
        return uqna_stat;
    }

    public void setUqna_stat(int uqna_stat) {
        this.uqna_stat = uqna_stat;
    }

    public String getUqna_type() {
        return uqna_type;
    }

    public void setUqna_type(String uqna_type) {
        this.uqna_type = uqna_type;
    }

    public String getUqna_answer() {
        return uqna_answer;
    }

    public void setUqna_answer(String uqna_answer) {
        this.uqna_answer = uqna_answer;
    }
}

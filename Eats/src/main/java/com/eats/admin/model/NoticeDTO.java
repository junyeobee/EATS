package com.eats.admin.model;

import java.util.Date;

public class NoticeDTO {
    private int ntc_idx;         // 공지사항 고유 번호
    private String ntc_title;    // 공지사항 제목
    private String ntc_content;  // 공지사항 내용
    private Date ntc_wdate;      // 공지사항 작성 날짜
    private int ntc_stat;        // 공지사항 상태 (1: 활성, 0: 비활성)

    // 기본 생성자
    public NoticeDTO() {}

    // 모든 필드를 포함한 생성자
    public NoticeDTO(int ntc_idx, String ntc_title, String ntc_content, Date ntc_wdate, int ntc_stat) {
        this.ntc_idx = ntc_idx;
        this.ntc_title = ntc_title;
        this.ntc_content = ntc_content;
        this.ntc_wdate = ntc_wdate;
        this.ntc_stat = ntc_stat;
    }

    // Getter and Setter
    public int getNtc_idx() {
        return ntc_idx;
    }

    public void setNtc_idx(int ntc_idx) {
        this.ntc_idx = ntc_idx;
    }

    public String getNtc_title() {
        return ntc_title;
    }

    public void setNtc_title(String ntc_title) {
        this.ntc_title = ntc_title;
    }

    public String getNtc_content() {
        return ntc_content;
    }

    public void setNtc_content(String ntc_content) {
        this.ntc_content = ntc_content;
    }

    public Date getNtc_wdate() {
        return ntc_wdate;
    }

    public void setNtc_wdate(Date ntc_wdate) {
        this.ntc_wdate = ntc_wdate;
    }

    public int getNtc_stat() {
        return ntc_stat;
    }

    public void setNtc_stat(int ntc_stat) {
        this.ntc_stat = ntc_stat;
    }

    @Override
    public String toString() {
        return "NoticeDTO{" +
                "ntc_idx=" + ntc_idx +
                ", ntc_title='" + ntc_title + '\'' +
                ", ntc_content='" + ntc_content + '\'' +
                ", ntc_wdate=" + ntc_wdate +
                ", ntc_stat=" + ntc_stat +
                '}';
    }
}

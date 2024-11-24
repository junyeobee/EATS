package com.eats.store.model;

import java.util.Date;

public class StoreQnaDTO {
    private int SQNA_IDX;
    private int STORE_IDX;   // 필드 이름을 그대로 두지만, getter/setter에서 카멜케이스 사용
    private String SQNA_TITLE;
    private String SQNA_CONTENT;
    private Date SQNA_WDATE;
    private int SQNA_STAT; // 0: 대기, 1: 완료
    private String SQNA_TYPE;
    private String SQNA_ANSWER;
    
    public StoreQnaDTO() {
        // 기본 생성자
    }

    public StoreQnaDTO(int SQNA_IDX, int STORE_IDX, String SQNA_TITLE, String SQNA_CONTENT, Date SQNA_WDATE,
                        int SQNA_STAT, String SQNA_TYPE, String SQNA_ANSWER) {
        super();
        this.SQNA_IDX = SQNA_IDX;
        this.STORE_IDX = STORE_IDX;
        this.SQNA_TITLE = SQNA_TITLE;
        this.SQNA_CONTENT = SQNA_CONTENT;
        this.SQNA_WDATE = SQNA_WDATE;
        this.SQNA_STAT = SQNA_STAT;
        this.SQNA_TYPE = SQNA_TYPE;
        this.SQNA_ANSWER = SQNA_ANSWER;
    }

    // Getters and Setters
    public int getSQNA_IDX() {
        return SQNA_IDX;
    }

    public void setSQNA_IDX(int SQNA_IDX) {
        this.SQNA_IDX = SQNA_IDX;
    }

    public int getSTORE_IDX() {  // 수정된 getter 메서드 이름
        return STORE_IDX;
    }

    public void setSTORE_IDX(int STORE_IDX) {  // 수정된 setter 메서드 이름
        this.STORE_IDX = STORE_IDX;
    }

    public String getSQNA_TITLE() {
        return SQNA_TITLE;
    }

    public void setSQNA_TITLE(String SQNA_TITLE) {
        this.SQNA_TITLE = SQNA_TITLE;
    }

    public String getSQNA_CONTENT() {
        return SQNA_CONTENT;
    }

    public void setSQNA_CONTENT(String SQNA_CONTENT) {
        this.SQNA_CONTENT = SQNA_CONTENT;
    }

    public Date getSQNA_WDATE() {
        return SQNA_WDATE;
    }

    public void setSQNA_WDATE(Date SQNA_WDATE) {
        this.SQNA_WDATE = SQNA_WDATE;
    }

    public int getSQNA_STAT() {
        return SQNA_STAT;
    }

    public void setSQNA_STAT(int SQNA_STAT) {
        this.SQNA_STAT = SQNA_STAT;
    }

    public String getSQNA_TYPE() {
        return SQNA_TYPE;
    }

    public void setSQNA_TYPE(String SQNA_TYPE) {
        this.SQNA_TYPE = SQNA_TYPE;
    }

    public String getSQNA_ANSWER() {
        return SQNA_ANSWER;
    }

    public void setSQNA_ANSWER(String SQNA_ANSWER) {
        this.SQNA_ANSWER = SQNA_ANSWER;
    }
}

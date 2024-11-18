package com.eats.user.model;

import java.math.BigDecimal;
import java.sql.Date;

public class PaymentDTO {

    private BigDecimal reserve_idx;  // 예약 번호 (BigDecimal 사용)
    private String store_name;       // 매장 이름
    private Date reserve_date;       // 예약 날짜
    private BigDecimal pay_price;    // 결제 금액 (BigDecimal 사용)
    private String pay_method;       // 결제 방법
    private String reserve_state;    // 예약 상태

    // 기본 생성자
    public PaymentDTO() {}

    // 모든 필드를 포함한 생성자
    public PaymentDTO(BigDecimal reserve_idx, String store_name, Date reserve_date,
                      BigDecimal pay_price, String pay_method, String reserve_state) {
        this.reserve_idx = reserve_idx;
        this.store_name = store_name;
        this.reserve_date = reserve_date;
        this.pay_price = pay_price;
        this.pay_method = pay_method;
        this.reserve_state = reserve_state;
    }

    // Getter and Setter
    public BigDecimal getReserve_idx() {
        return reserve_idx;
    }

    public void setReserve_idx(BigDecimal reserve_idx) {
        this.reserve_idx = reserve_idx;
    }

    public BigDecimal getPay_price() {
        return pay_price;
    }

    public void setPay_price(BigDecimal pay_price) {
        this.pay_price = pay_price;
    }

    public String getStore_name() {
        return store_name;
    }

    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    public Date getReserve_date() {
        return reserve_date;
    }

    public void setReserve_date(Date reserve_date) {
        this.reserve_date = reserve_date;
    }

    public String getPay_method() {
        return pay_method;
    }

    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    public String getReserve_state() {
        return reserve_state;
    }

    public void setReserve_state(String reserve_state) {
        this.reserve_state = reserve_state;
    }
}

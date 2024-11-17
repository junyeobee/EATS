package com.eats.kakao.model;

public class KakaoPayCancelDTO {
    private String aid;          // 요청 고유 번호
    private String tid;          // 결제 고유 번호
    private String status;       // 결제 상태
    private Amount amount;       // 결제 금액 정보
    private String created_at;   // 결제 취소 시각
    
    public KakaoPayCancelDTO() {
		// TODO Auto-generated constructor stub
	}

	public KakaoPayCancelDTO(String aid, String tid, String status, Amount amount, String created_at) {
		super();
		this.aid = aid;
		this.tid = tid;
		this.status = status;
		this.amount = amount;
		this.created_at = created_at;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Amount getAmount() {
		return amount;
	}

	public void setAmount(Amount amount) {
		this.amount = amount;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
    
	
}

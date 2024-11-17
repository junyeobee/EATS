package com.eats.kakao.model;

public class KakaoPayReadyDTO {
	private String tid; // 결제 고유 번호
	private String next_redirect_mobile_url; // 모바일 웹일 경우 리다이렉트 URL
	private String next_redirect_pc_url; // PC 웹일 경우 리다이렉트 URL
	private String created_at; // 결제 준비 요청 시간
	
	public KakaoPayReadyDTO() {
		// TODO Auto-generated constructor stub
	}

	public KakaoPayReadyDTO(String tid, String next_redirect_mobile_url, String next_redirect_pc_url,
			String created_at) {
		super();
		this.tid = tid;
		this.next_redirect_mobile_url = next_redirect_mobile_url;
		this.next_redirect_pc_url = next_redirect_pc_url;
		this.created_at = created_at;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getNext_redirect_mobile_url() {
		return next_redirect_mobile_url;
	}

	public void setNext_redirect_mobile_url(String next_redirect_mobile_url) {
		this.next_redirect_mobile_url = next_redirect_mobile_url;
	}

	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}

	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
}

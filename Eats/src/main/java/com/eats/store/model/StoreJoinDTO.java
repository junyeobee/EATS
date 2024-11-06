package com.eats.store.model;

public class StoreJoinDTO {
    private int sj_idx;           // 신청 ID
    private String sj_name;       // 신청자 매장 이름
    private String biz_num;       // 사업자 등록 번호
    private String owner_name;    // 점주 이름
    private String owner_tel;     // 점주 연락처
    private String sj_email;      // 점주 이메일
    private String sj_addr;       // 매장 주소
    private String sj_daddr;      // 매장 상세 주소
    private String sj_id;         // 승인 시 사용할 아이디
    private String sj_pwd;        // 승인 시 사용할 비밀번호
    
	public StoreJoinDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoreJoinDTO(int sj_idx, String sj_name, String biz_num, String owner_name, String owner_tel,
			String sj_email, String sj_addr, String sj_daddr, String sj_id, String sj_pwd) {
		super();
		this.sj_idx = sj_idx;
		this.sj_name = sj_name;
		this.biz_num = biz_num;
		this.owner_name = owner_name;
		this.owner_tel = owner_tel;
		this.sj_email = sj_email;
		this.sj_addr = sj_addr;
		this.sj_daddr = sj_daddr;
		this.sj_id = sj_id;
		this.sj_pwd = sj_pwd;
	}

	public int getSj_idx() {
		return sj_idx;
	}

	public void setSj_idx(int sj_idx) {
		this.sj_idx = sj_idx;
	}

	public String getSj_name() {
		return sj_name;
	}

	public void setSj_name(String sj_name) {
		this.sj_name = sj_name;
	}

	public String getBiz_num() {
		return biz_num;
	}

	public void setBiz_num(String biz_num) {
		this.biz_num = biz_num;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	public String getOwner_tel() {
		return owner_tel;
	}

	public void setOwner_tel(String owner_tel) {
		this.owner_tel = owner_tel;
	}

	public String getSj_email() {
		return sj_email;
	}

	public void setSj_email(String sj_email) {
		this.sj_email = sj_email;
	}

	public String getSj_addr() {
		return sj_addr;
	}

	public void setSj_addr(String sj_addr) {
		this.sj_addr = sj_addr;
	}

	public String getSj_daddr() {
		return sj_daddr;
	}

	public void setSj_daddr(String sj_daddr) {
		this.sj_daddr = sj_daddr;
	}

	public String getSj_id() {
		return sj_id;
	}

	public void setSj_id(String sj_id) {
		this.sj_id = sj_id;
	}

	public String getSj_pwd() {
		return sj_pwd;
	}

	public void setSj_pwd(String sj_pwd) {
		this.sj_pwd = sj_pwd;
	}
    
   
}

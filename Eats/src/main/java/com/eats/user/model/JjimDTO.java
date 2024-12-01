package com.eats.user.model;

public class JjimDTO {
    private int user_idx;     // 사용자 ID
    private int store_idx;    // 매장 ID
    private String store_name; // 매장 이름
    private String store_addr; // 매장 주소
    private String store_tel;  // 매장 전화번호
    private String store_image; // 매장 이미지 URL

    // 기본 생성자
    public JjimDTO() {}

    public JjimDTO(int user_idx, int store_idx) {
        this.user_idx = user_idx;
        this.store_idx = store_idx;
    }

	public JjimDTO(int user_idx, int store_idx, String store_name, String store_addr, String store_tel,
			String store_image) {
		super();
		this.user_idx = user_idx;
		this.store_idx = store_idx;
		this.store_name = store_name;
		this.store_addr = store_addr;
		this.store_tel = store_tel;
		this.store_image = store_image;
	}

	// Getter & Setter
    public int getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(int user_idx) {
        this.user_idx = user_idx;
    }

    public int getStore_idx() {
        return store_idx;
    }

    public void setStore_idx(int store_idx) {
        this.store_idx = store_idx;
    }

    public String getStore_name() {
        return store_name;
    }

    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    public String getStore_addr() {
        return store_addr;
    }

    public void setStore_addr(String store_addr) {
        this.store_addr = store_addr;
    }

    public String getStore_tel() {
        return store_tel;
    }

    public void setStore_tel(String store_tel) {
        this.store_tel = store_tel;
    }

	public String getStore_image() {
		return store_image;
	}

	public void setStore_image(String store_image) {
		this.store_image = store_image;
	}

  
}

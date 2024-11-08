package com.eats.kakao.model;

public class KakaoUserDTO {
	
	private Long id;
	private String nickname;
	
	public KakaoUserDTO() {
		super();
	}

	public KakaoUserDTO(Long id, String nickname) {
		super();
		this.id = id;
		this.nickname = nickname;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
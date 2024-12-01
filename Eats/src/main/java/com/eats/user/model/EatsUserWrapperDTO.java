package com.eats.user.model;

public class EatsUserWrapperDTO {

	private EatsUserDTO user;
	private EatsProfileDTO profile;
	
	public EatsUserWrapperDTO() {
		
	}

	public EatsUserWrapperDTO(EatsUserDTO user, EatsProfileDTO profile) {
		super();
		this.user = user;
		this.profile = profile;
	}

	public EatsUserDTO getUser() {
		return user;
	}

	public void setUser(EatsUserDTO user) {
		this.user = user;
	}

	public EatsProfileDTO getProfile() {
		return profile;
	}

	public void setProfile(EatsProfileDTO profile) {
		this.profile = profile;
	}
	
}

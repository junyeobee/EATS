package com.eats.user.model;

import org.springframework.web.multipart.MultipartFile;

public class EatsUserProfileDTO {
    private int user_idx;
    private String user_nickname;
    private String user_intro;
    private String user_location;
    private String user_tel;
    private int user_point;
    private MultipartFile profile_image; // 업로드된 파일 처리용
    private String profile_image_path; // 실제 파일 경로 저장

    // 기본 생성자
    public EatsUserProfileDTO() {
        this.profile_image_path = "/myPageImg/default-icon.png"; // 기본 프로필 이미지 경로
    }

    // 모든 필드 포함 생성자
    public EatsUserProfileDTO(int user_idx, String user_nickname, String user_intro, String user_location,
                              String user_tel, int user_point, String profile_image_path) {
        this.user_idx = user_idx;
        this.user_nickname = user_nickname;
        this.user_intro = user_intro;
        this.user_location = user_location;
        this.user_tel = user_tel;
        this.user_point = user_point;
        this.profile_image_path = (profile_image_path == null || profile_image_path.isEmpty()) 
                                    ? "/myPageImg/default-icon.png" 
                                    : profile_image_path;
    }

    // Getter and Setter
    public int getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(int user_idx) {
        this.user_idx = user_idx;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public String getUser_intro() {
        return user_intro;
    }

    public void setUser_intro(String user_intro) {
        this.user_intro = user_intro;
    }

    public String getUser_location() {
        return user_location;
    }

    public void setUser_location(String user_location) {
        this.user_location = user_location;
    }

    public String getUser_tel() {
        return user_tel;
    }

    public void setUser_tel(String user_tel) {
        this.user_tel = user_tel;
    }

    public int getUser_point() {
        return user_point;
    }

    public void setUser_point(int user_point) {
        this.user_point = user_point;
    }

    public MultipartFile getProfile_image() {
        return profile_image;
    }

    public void setProfile_image(MultipartFile profile_image) {
        this.profile_image = profile_image;
    }

    public String getProfile_image_path() {
        return profile_image_path;
    }

    public void setProfile_image_path(String profile_image_path) {
        this.profile_image_path = (profile_image_path == null || profile_image_path.isEmpty()) 
                                    ? "/myPageImg/default-icon.png" 
                                    : profile_image_path;
    }
}

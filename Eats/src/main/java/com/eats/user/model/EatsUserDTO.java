package com.eats.user.model;

public class EatsUserDTO {
    private int user_idx;
    private String user_id;
    private String user_pwd;
    private String user_name;
    private String user_email;
    private String user_birth;
    private int user_gender;
    private String join_method;
    private String user_nickname;   // 닉네임 추가
    private int user_point;         // 포인트 추가

    // 기본 생성자
    public EatsUserDTO() {}

    // 모든 필드 포함 생성자
    public EatsUserDTO(int user_idx, String user_id, String user_pwd, String user_name, String user_email,
                       String user_birth, int user_gender, String join_method, String user_nickname, int user_point) {
        this.user_idx = user_idx;
        this.user_id = user_id;
        this.user_pwd = user_pwd;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_birth = user_birth;
        this.user_gender = user_gender;
        this.join_method = join_method;
        this.user_nickname = user_nickname;
        this.user_point = user_point;
    }

    // Getter and Setter
    public int getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(int user_idx) {
        this.user_idx = user_idx;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_pwd() {
        return user_pwd;
    }

    public void setUser_pwd(String user_pwd) {
        this.user_pwd = user_pwd;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_birth() {
        return user_birth;
    }

    public void setUser_birth(String user_birth) {
        this.user_birth = user_birth;
    }

    public int getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(int user_gender) {
        this.user_gender = user_gender;
    }

    public String getJoin_method() {
        return join_method;
    }

    public void setJoin_method(String join_method) {
        this.join_method = join_method;
    }

    public String getUser_nickname() {
        return user_nickname;
    }

    public void setUser_nickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }

    public int getUser_point() {
        return user_point;
    }

    public void setUser_point(int user_point) {
        this.user_point = user_point;
    }
}

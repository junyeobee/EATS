package com.eats.store.model;

import java.util.List;
import java.util.ArrayList;
import org.springframework.web.multipart.MultipartFile;

public class StoreImgBeforeDTO {

    private int si_idx;
    private int store_idx;
    
    private String store_img1, store_img2, store_img3, store_img4, store_img5;
    
    public StoreImgBeforeDTO() {
		// TODO Auto-generated constructor stub
	}
    
	public StoreImgBeforeDTO(int si_idx, int store_idx, String store_img1, String store_img2, String store_img3,
			String store_img4, String store_img5) {
		super();
		this.si_idx = si_idx;
		this.store_idx = store_idx;
		this.store_img1 = store_img1;
		this.store_img2 = store_img2;
		this.store_img3 = store_img3;
		this.store_img4 = store_img4;
		this.store_img5 = store_img5;
	}

	public int getSi_idx() {
		return si_idx;
	}

	public void setSi_idx(int si_idx) {
		this.si_idx = si_idx;
	}

	public int getStore_idx() {
		return store_idx;
	}

	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}

	public String getStore_img1() {
		return store_img1;
	}

	public void setStore_img1(String store_img1) {
		this.store_img1 = store_img1;
	}

	public String getStore_img2() {
		return store_img2;
	}

	public void setStore_img2(String store_img2) {
		this.store_img2 = store_img2;
	}

	public String getStore_img3() {
		return store_img3;
	}

	public void setStore_img3(String store_img3) {
		this.store_img3 = store_img3;
	}

	public String getStore_img4() {
		return store_img4;
	}

	public void setStore_img4(String store_img4) {
		this.store_img4 = store_img4;
	}

	public String getStore_img5() {
		return store_img5;
	}

	public void setStore_img5(String store_img5) {
		this.store_img5 = store_img5;
	}
}
    
    /*
    private List<MultipartFile> store_img1; 
    private List<MultipartFile> store_img2;
    private List<MultipartFile> store_img3;
    private List<MultipartFile> store_img4;
    private List<MultipartFile> store_img5;

    // 저장할 파일 경로 리스트 (null이 아닌 기본값을 사용하여 초기화)
    private List<String> img1 = new ArrayList<>();
    private List<String> img2 = new ArrayList<>();
    private List<String> img3 = new ArrayList<>();
    private List<String> img4 = new ArrayList<>();
    private List<String> img5 = new ArrayList<>();

    // 이미지 경로 리스트에 경로 추가 메서드
    public void addImg1(String path) {
        this.img1.add(path);
    }

    public void addImg2(String path) {
        this.img2.add(path);
    }

    public void addImg3(String path) {
        this.img3.add(path);
    }

    public void addImg4(String path) {
        this.img4.add(path);
    }

    public void addImg5(String path) {
        this.img5.add(path);
    }
    // Getter & Setter
    public int getSi_idx() {
        return si_idx;
    }

    public void setSi_idx(int si_idx) {
        this.si_idx = si_idx;
    }

    public int getStore_idx() {
        return store_idx;
    }

    public void setStore_idx(int store_idx) {
        this.store_idx = store_idx;
    }

    public List<MultipartFile> getStore_img1() {
        return store_img1;
    }

    public void setStore_img1(List<MultipartFile> store_img1) {
        this.store_img1 = store_img1;
    }

    public List<MultipartFile> getStore_img2() {
        return store_img2;
    }

    public void setStore_img2(List<MultipartFile> store_img2) {
        this.store_img2 = store_img2;
    }

    public List<MultipartFile> getStore_img3() {
        return store_img3;
    }

    public void setStore_img3(List<MultipartFile> store_img3) {
        this.store_img3 = store_img3;
    }

    public List<MultipartFile> getStore_img4() {
        return store_img4;
    }

    public void setStore_img4(List<MultipartFile> store_img4) {
        this.store_img4 = store_img4;
    }

    public List<MultipartFile> getStore_img5() {
        return store_img5;
    }

    public void setStore_img5(List<MultipartFile> store_img5) {
        this.store_img5 = store_img5;
    }

    public List<String> getImg1() {
        return img1;
    }

    public void setImg1(List<String> img1) {
        this.img1 = img1;
    }

    public List<String> getImg2() {
        return img2;
    }

    public void setImg2(List<String> img2) {
        this.img2 = img2;
    }

    public List<String> getImg3() {
        return img3;
    }

    public void setImg3(List<String> img3) {
        this.img3 = img3;
    }

    public List<String> getImg4() {
        return img4;
    }

    public void setImg4(List<String> img4) {
        this.img4 = img4;
    }

    public List<String> getImg5() {
        return img5;
    }

    public void setImg5(List<String> img5) {
        this.img5 = img5;
    }

	@Override
	public String toString() {
		return "StoreImgDTO [si_idx=" + si_idx + ", store_idx=" + store_idx + ", store_img1=" + store_img1
				+ ", store_img2=" + store_img2 + ", store_img3=" + store_img3 + ", store_img4=" + store_img4
				+ ", store_img5=" + store_img5 + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4="
				+ img4 + ", img5=" + img5 + "]";
	}
    */
    

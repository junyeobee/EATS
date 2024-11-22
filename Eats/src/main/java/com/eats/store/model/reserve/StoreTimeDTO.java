package com.eats.store.model.reserve;

public class StoreTimeDTO {
    private String stime_start;
    private String stime_end;
    private String stime_break;
    
    public StoreTimeDTO() {
		// TODO Auto-generated constructor stub
	}

	public StoreTimeDTO(String stime_start, String stime_end, String stime_break) {
		this.stime_start = stime_start;
		this.stime_end = stime_end;
		this.stime_break = stime_break;
	}

	public String getStime_start() {
		return stime_start;
	}

	public void setStime_start(String stime_start) {
		this.stime_start = stime_start;
	}

	public String getStime_end() {
		return stime_end;
	}

	public void setStime_end(String stime_end) {
		this.stime_end = stime_end;
	}

	public String getStime_break() {
		return stime_break;
	}

	public void setStime_break(String stime_break) {
		this.stime_break = stime_break;
	}

	
    
}

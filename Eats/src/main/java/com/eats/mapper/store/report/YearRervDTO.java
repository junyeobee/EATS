package com.eats.mapper.store.report;

import java.util.Map;

public class YearRervDTO {
    private int yearAvg;
    private int currMonAvg;
    private int growthRate;
    private Map<String, Integer> monAvg;
    private int yearTotal;
    private int currMonTotal;
    
    public YearRervDTO() {
		// TODO Auto-generated constructor stub
	}

	public YearRervDTO(int yearAvg, int currMonAvg, int growthRate, Map<String, Integer> monAvg, int yearTotal,
			int currMonTotal) {
		super();
		this.yearAvg = yearAvg;
		this.currMonAvg = currMonAvg;
		this.growthRate = growthRate;
		this.monAvg = monAvg;
		this.yearTotal = yearTotal;
		this.currMonTotal = currMonTotal;
	}

	public int getYearAvg() {
		return yearAvg;
	}

	public void setYearAvg(int yearAvg) {
		this.yearAvg = yearAvg;
	}

	public int getCurrMonAvg() {
		return currMonAvg;
	}

	public void setCurrMonAvg(int currMonAvg) {
		this.currMonAvg = currMonAvg;
	}

	public int getGrowthRate() {
		return growthRate;
	}

	public void setGrowthRate(int growthRate) {
		this.growthRate = growthRate;
	}

	public Map<String, Integer> getMonAvg() {
		return monAvg;
	}

	public void setMonAvg(Map<String, Integer> monAvg) {
		this.monAvg = monAvg;
	}

	public int getYearTotal() {
		return yearTotal;
	}

	public void setYearTotal(int yearTotal) {
		this.yearTotal = yearTotal;
	}

	public int getCurrMonTotal() {
		return currMonTotal;
	}

	public void setCurrMonTotal(int currMonTotal) {
		this.currMonTotal = currMonTotal;
	}
    
}

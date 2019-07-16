package co.yedam.cafein.vo;

import java.util.Date;

public class StoreCloseVO {
	private String sId;
	private Date closeTime;
	private int cash;
	private int defaultCash;
	private int orCash;
	private int difference;
	private int netIncome;
	
	
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public Date getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(Date closeTime) {
		this.closeTime = closeTime;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public int getDefaultCash() {
		return defaultCash;
	}
	public void setDefaultCash(int defaultCash) {
		this.defaultCash = defaultCash;
	}
	public int getOrCash() {
		return orCash;
	}
	public void setOrCash(int orCash) {
		this.orCash = orCash;
	}
	public int getDifference() {
		return difference;
	}
	public void setDifference(int difference) {
		this.difference = difference;
	}
	public int getNetIncome() {
		return netIncome;
	}
	public void setNetIncome(int netIncome) {
		this.netIncome = netIncome;
	}
	
	@Override
	public String toString() {
		return "StoreCloseVO [sId=" + sId + ", closeTime=" + closeTime + ", cash=" + cash + ", defaultCash="
				+ defaultCash + ", orCash=" + orCash + ", difference=" + difference + ", netIncome=" + netIncome + "]";
	}

}

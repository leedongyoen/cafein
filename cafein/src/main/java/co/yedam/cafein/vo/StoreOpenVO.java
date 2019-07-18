package co.yedam.cafein.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(ignoreUnknown = true)
public class StoreOpenVO {
	private String sId;
	private Date openTime;
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
	public Date getOpenTime() {
		return openTime;
	}
	public void setOpenTime(Date openTime) {
		this.openTime = openTime;
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
		return "StoreOpenVO [sId=" + sId + ", openTime=" + openTime + ", closeTime=" + closeTime + ", cash=" + cash
				+ ", defaultCash=" + defaultCash + ", orCash=" + orCash + ", difference=" + difference + ", netIncome="
				+ netIncome + "]";
	}

}

package co.yedam.cafein.vo;


import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(ignoreUnknown = true)
public class StoreOpenVO {
	private String sId;
	@JsonFormat(pattern="yy/MM/dd HH:mm", timezone ="Asia/Seoul")
	private Timestamp openTime;
	@JsonFormat(pattern="yy/MM/dd HH:mm", timezone ="Asia/Seoul")
	private Timestamp closeTime;
	private int cash;				// 현금시재
	private int defaultCash;		// 기본준비금
	private int orCash;				// 영업지출금
	private int difference;			// 차액
	private int netIncome;			// 순수익
	private int usedMile;			// 현금결제 시 사용된 마일리지
	private int cashSum;			// 현금 매출액
	private int checkOpen;
	
	// 매장 마감 내역 조회 페이지 -> 날짜 검색
	private String startDate;
	private String endDate;
	
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public Timestamp getOpenTime() {
		return openTime;
	}
	public void setOpenTime(Timestamp openTime) {
		this.openTime = openTime;
	}
	public Timestamp getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(Timestamp closeTime) {
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
	public int getUsedMile() {
		return usedMile;
	}
	public void setUsedMile(int usedMile) {
		this.usedMile = usedMile;
	}
	public int getCashSum() {
		return cashSum;
	}
	public void setCashSum(int cashSum) {
		this.cashSum = cashSum;
	}
	public int getCheckOpen() {
		return checkOpen;
	}
	public void setCheckOpen(int checkOpen) {
		this.checkOpen = checkOpen;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "StoreOpenVO [sId=" + sId + ", openTime=" + openTime + ", closeTime=" + closeTime + ", cash=" + cash
				+ ", defaultCash=" + defaultCash + ", orCash=" + orCash + ", difference=" + difference + ", netIncome="
				+ netIncome + ", usedMile=" + usedMile + ", cashSum=" + cashSum + ", checkOpen=" + checkOpen
				+ ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
}

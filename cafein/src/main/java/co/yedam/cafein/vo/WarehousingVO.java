package co.yedam.cafein.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class WarehousingVO {

	private String wareNum;
	private Timestamp wareDate;
	private int wareQty;
	private String warePrice;
	private String stNum;
	private String sId;
	private String stPayMethod;
	private String stName;
	private int stLoss;
	
	private int enterQty;
	private String startDate;
	private String endDate;
	private int sum;
	
	public String getWareNum() {
		return wareNum;
	}
	public void setWareNum(String wareNum) {
		this.wareNum = wareNum;
	}
	public Timestamp getWareDate() {
		return wareDate;
	}
	public void setWareDate(Timestamp wareDate) {
		this.wareDate = wareDate;
	}
	public int getWareQty() {
		return wareQty;
	}
	public void setWareQty(int wareQty) {
		this.wareQty = wareQty;
	}
	public String getWarePrice() {
		return warePrice;
	}
	public void setWarePrice(String warePrice) {
		this.warePrice = warePrice;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	
	public String getStPayMethod() {
		return stPayMethod;
	}
	public void setStPayMethod(String stPayMethod) {
		this.stPayMethod = stPayMethod;
	}
	public int getStLoss() {
		return stLoss;
	}
	public void setStLoss(int stLoss) {
		this.stLoss = stLoss;
	}
	
	
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
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
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	
	public int getEnterQty() {
		return enterQty;
	}
	public void setEnterQty(int enterQty) {
		this.enterQty = enterQty;
	}
	@Override
	public String toString() {
		return "WarehousingVO [wareNum=" + wareNum + ", wareDate=" + wareDate + ", wareQty=" + wareQty + ", warePrice="
				+ warePrice + ", stNum=" + stNum + ", sId=" + sId + ", stPayMethod=" + stPayMethod + ", stName="
				+ stName + ", stLoss=" + stLoss + ", startDate=" + startDate + ", endDate=" + endDate + ", sum=" + sum
				+ "]";
	}
	
}

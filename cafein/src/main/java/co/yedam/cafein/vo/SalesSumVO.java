package co.yedam.cafein.vo;

import java.security.Timestamp;

public class SalesSumVO {

	private String oNum;
	private String oDnum;
	private String 	mNum;
	private String 	mName;
	private Timestamp oDate;
	private int total;
	private String oQty;
	
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	public String getoDnum() {
		return oDnum;
	}
	public void setoDnum(String oDnum) {
		this.oDnum = oDnum;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public Timestamp getoDate() {
		return oDate;
	}
	public void setoDate(Timestamp oDate) {
		this.oDate = oDate;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getoQty() {
		return oQty;
	}
	public void setoQty(String oQty) {
		this.oQty = oQty;
	}
	@Override
	public String toString() {
		return "SalesSumVO [oNum=" + oNum + ", oDnum=" + oDnum + ", mNum=" + mNum + ", mName=" + mName + ", oDate="
				+ oDate + ", total=" + total + ", oQty=" + oQty + "]";
	}
	
	
	
}

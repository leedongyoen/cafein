package co.yedam.cafein.vo;

import java.sql.Timestamp;



public class SalesSumVO {

	private String oNum;
	private String oDnum;
	private String 	mNum;
	private String 	mName;
	private Timestamp oDate;
	private int total;
	private String oQty;
	private int mPrice;
	private String week;
	private String sId; 
	private String dates;
	private int cnt;
	private int atotal;
	private int yee;

	
	
	
	public int getYee() {
		return yee;
	}
	public void setYee(int yee) {
		this.yee = yee;
	}
	public int getAtotal() {
		return atotal;
	}
	public void setAtotal(int atotal) {
		this.atotal = atotal;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
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

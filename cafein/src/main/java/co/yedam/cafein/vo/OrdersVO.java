package co.yedam.cafein.vo;

import java.sql.Timestamp;

public class OrdersVO {

	private String oNum;
	private String cId;
	private Timestamp oDate;
	private int total;
	private String receipt;
	private String sId;
	private String payMethod;
	private int mileage;
	
	// store name을 가져오기 위해서
	private String sName;
	
	
	
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
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
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	@Override
	public String toString() {
		return "OrdersVO [oNum=" + oNum + ", cId=" + cId + ", oDate=" + oDate + ", total=" + total + ", receipt="
				+ receipt + ", sId=" + sId + ", payMethod=" + payMethod + ", mileage=" + mileage + "]";
	}

}

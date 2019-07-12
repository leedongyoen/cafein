package co.yedam.cafein.vo;

import java.sql.Timestamp;

public class ReserveVO {

	private int mileNum;
	private int mileAge;
	private String sId;
	private String cId;
	private String sName;
	private Timestamp oDate;
	private String dates;
	
	
	
	
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public int getMileNum() {
		return mileNum;
	}
	public void setMileNum(int mileNum) {
		this.mileNum = mileNum;
	}
	public int getMileAge() {
		return mileAge;
	}
	public void setMileAge(int mileAge) {
		this.mileAge = mileAge;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public Timestamp getoDate() {
		return oDate;
	}
	public void setoDate(Timestamp oDate) {
		this.oDate = oDate;
	}
	
	
	
}

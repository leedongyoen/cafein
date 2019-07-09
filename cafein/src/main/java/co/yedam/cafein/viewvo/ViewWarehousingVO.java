package co.yedam.cafein.viewvo;

import java.util.Date;

public class ViewWarehousingVO {
	private Date wareDate;
	private int wareQty;
	private String warePrice;
	private String stNum;
	private String stName;
	private String sId;
	private String stPayMethod;
	
	public Date getWareDate() {
		return wareDate;
	}
	public void setWareDate(Date wareDate) {
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
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
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
	@Override
	public String toString() {
		return "ViewWarehousingVO [wareDate=" + wareDate + ", wareQty=" + wareQty + ", warePrice=" + warePrice
				+ ", stNum=" + stNum + ", stName=" + stName + ", sId=" + sId + ", stPayMethod=" + stPayMethod + "]";
	}

}

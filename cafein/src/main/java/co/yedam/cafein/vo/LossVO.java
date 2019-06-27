package co.yedam.cafein.vo;

import java.sql.Date;

public class LossVO {
	private Date lossDate;
	private String sId;
	private String stNum;
	private int lossVal;
	public Date getLossDate() {
		return lossDate;
	}
	public void setLossDate(Date lossDate) {
		this.lossDate = lossDate;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public int getLossVal() {
		return lossVal;
	}
	public void setLossVal(int lossVal) {
		this.lossVal = lossVal;
	}
	@Override
	public String toString() {
		return "LossVO [lossDate=" + lossDate + ", sId=" + sId + ", stNum=" + stNum + ", lossVal=" + lossVal + "]";
	}
	
	

}

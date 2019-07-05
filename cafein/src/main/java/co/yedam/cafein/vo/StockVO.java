package co.yedam.cafein.vo;

public class StockVO {

	private String stNum;
	private String sId;
	private String stName;
	private int stQty;
	private int stAqty;
	private int stPrice;
	private String caNum;
	private int stanUnit;
	private String stStatus;
	private int truthQty;
	
	private int[] stNumList;
	
	
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
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public int getStQty() {
		return stQty;
	}
	public void setStQty(int stQty) {
		this.stQty = stQty;
	}
	public int getStAqty() {
		return stAqty;
	}
	public void setStAqty(int stAqty) {
		this.stAqty = stAqty;
	}
	public int getStPrice() {
		return stPrice;
	}
	public void setStPrice(int stPrice) {
		this.stPrice = stPrice;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public int getStanUnit() {
		return stanUnit;
	}
	public void setStanUnit(int stanUnit) {
		this.stanUnit = stanUnit;
	}
	public String getStStatus() {
		return stStatus;
	}
	public void setStStatus(String stStatus) {
		this.stStatus = stStatus;
	}
	public int getTruthQty() {
		return truthQty;
	}
	public void setTruthQty(int truthQty) {
		this.truthQty = truthQty;
	}
	
	
	public int[] getStNumList() {
		return stNumList;
	}
	public void setStNumList(int[] stNumList) {
		this.stNumList = stNumList;
	}
	@Override
	public String toString() {
		return "StockVO [stNum=" + stNum + ", sId=" + sId + ", stName=" + stName + ", stQty=" + stQty + ", stAqty="
				+ stAqty + ", stPrice=" + stPrice + ", caNum=" + caNum + ", stanUnit=" + stanUnit + ", stStatus="
				+ stStatus + ", truthQty=" + truthQty + "]";
	}
	
}

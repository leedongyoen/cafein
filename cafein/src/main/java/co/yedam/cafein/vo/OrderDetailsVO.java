package co.yedam.cafein.vo;

public class OrderDetailsVO {

	private String oDnum;
	private String oNum;
	private String mNum;
	private String oQty;
	
	public String getoDnum() {
		return oDnum;
	}
	public void setoDnum(String oDnum) {
		this.oDnum = oDnum;
	}
	public String getoNum() {
		return oNum;
	}
	public void setoNum(String oNum) {
		this.oNum = oNum;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getoQty() {
		return oQty;
	}
	public void setoQty(String oQty) {
		this.oQty = oQty;
	}
	@Override
	public String toString() {
		return "OrderDetailsVO [oDnum=" + oDnum + ", oNum=" + oNum + ", mNum=" + mNum + ", oQty=" + oQty + "]";
	}
	
	
}

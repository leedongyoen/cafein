package co.yedam.cafein.vo;

public class OrderDetailsVO {

	private String oDnum;
	private String oNum;
	private String mNum;
	private String oQty;
	
	private String opName;
	private String opDnum;
	private String mName;
	
	
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}
	public String getOpDnum() {
		return opDnum;
	}
	public void setOpDnum(String opDnum) {
		this.opDnum = opDnum;
	}
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
		return "OrderDetailsVO [oDnum=" + oDnum + ", oNum=" + oNum + ", mNum=" + mNum + ", oQty=" + oQty + ", opName="
				+ opName + ", opDnum=" + opDnum + ", mName=" + mName + "]";
	}
	
}

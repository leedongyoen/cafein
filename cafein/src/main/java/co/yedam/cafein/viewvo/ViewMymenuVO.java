package co.yedam.cafein.viewvo;

public class ViewMymenuVO {
	
	private String cId;
	private String sName;
	private String mName;
	private int mPrice;
	private String caNum;
	private String cuNum;
	private String opNum;
	
	
	
	public String getCuNum() {
		return cuNum;
	}
	public void setCuNum(String cuNum) {
		this.cuNum = cuNum;
	}
	public String getOpNum() {
		return opNum;
	}
	public void setOpNum(String opNum) {
		this.opNum = opNum;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
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
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	@Override
	public String toString() {
		return "ViewMymenuVO [cId=" + cId + ", sName=" + sName + ", mName=" + mName + ", mPrice=" + mPrice + ", caNum="
				+ caNum + ", cuNum=" + cuNum + ", opNum=" + opNum + "]";
	}
	
	
	
	

}

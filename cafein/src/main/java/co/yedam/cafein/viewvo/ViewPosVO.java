package co.yedam.cafein.viewvo;

public class ViewPosVO {
	
	private String sId;
	private String mName;
	private String stNum;
	private String mNum;
	private String stName;
	private String caNum;
	private String opName;
	private int opPrice;
	private int mPrice;
	
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}
	public int getOpPrice() {
		return opPrice;
	}
	public void setOpPrice(int opPrice) {
		this.opPrice = opPrice;
	}
	@Override
	public String toString() {
		return "ViewPosVO [sId=" + sId + ", mName=" + mName + ", stNum=" + stNum + ", mNum=" + mNum + ", stName="
				+ stName + ", caNum=" + caNum + ", opName=" + opName + ", opPrice=" + opPrice + ", mPrice=" + mPrice
				+ "]";
	}
	
	
	
	
	
	

}

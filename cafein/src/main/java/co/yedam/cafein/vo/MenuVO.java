package co.yedam.cafein.vo;

public class MenuVO {
	
	private String 	mNum;
	private String 	mName;
	private int		mPrice;
	private String	sId;
	private String	caNum;
	private String	mStat;
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
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getmStat() {
		return mStat;
	}
	public void setmStat(String mStat) {
		this.mStat = mStat;
	}
	@Override
	public String toString() {
		return "MenuVO [mNum=" + mNum + ", mName=" + mName + ", mPrice=" + mPrice + ", sId=" + sId + ", caNum=" + caNum
				+ ", mStat=" + mStat + "]";
	}

	
	
	
}

package co.yedam.cafein.vo;

public class CustomerMainVO {
	
	private String cId;
	private String sName;
	private String sId;
	private String sAdd;
	private int oQty;
	private String mNum;
	private String rank;
	private String cnt;
	private String oNum;
	private String mName;
	private String opDnum;
	private String oDnum;
	
	
	
	
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
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
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
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
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getsAdd() {
		return sAdd;
	}
	public void setsAdd(String sAdd) {
		this.sAdd = sAdd;
	}
	public int getoQty() {
		return oQty;
	}
	public void setoQty(int oQty) {
		this.oQty = oQty;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "CustomerMainVO [cId=" + cId + ", sName=" + sName + ", sId=" + sId + ", sAdd=" + sAdd + ", oQty=" + oQty
				+ ", mNum=" + mNum + ", rank=" + rank + "]";
	}
	
	
}

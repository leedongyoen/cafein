package co.yedam.cafein.vo;

import java.util.Arrays;

public class MyMenuVO {
	
	private String myNum;
	private String cId;
	private String mNum;
	private String cuNum;
	private String[] cuNumList; // 옵션 저장.
	private String caNum;
	private String recipeno;
	
	// java에서 필요한 부분
	private String sId;
	private String hotice;
	private String stNum;
	
	
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	public String getRecipeno() {
		return recipeno;
	}
	public void setRecipeno(String recipeno) {
		this.recipeno = recipeno;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getHotice() {
		return hotice;
	}
	public void setHotice(String hotice) {
		this.hotice = hotice;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String[] getCuNumList() {
		return cuNumList;
	}
	public void setCuNumList(String[] cuNumList) {
		this.cuNumList = cuNumList;
	}
	public String getMyNum() {
		return myNum;
	}
	public void setMyNum(String myNum) {
		this.myNum = myNum;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}
	public String getCuNum() {
		return cuNum;
	}
	public void setCuNum(String cuNum) {
		this.cuNum = cuNum;
	}
	@Override
	public String toString() {
		return "MyMenuVO [myNum=" + myNum + ", cId=" + cId + ", mNum=" + mNum + ", cuNum=" + cuNum + ", cuNumList="
				+ Arrays.toString(cuNumList) + ", caNum=" + caNum + ", recipeno=" + recipeno + ", sId=" + sId
				+ ", hotice=" + hotice + ", stNum=" + stNum + "]";
	}
	
	

}

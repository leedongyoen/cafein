package co.yedam.cafein.vo;

import java.util.Arrays;

public class CartVO {

	private String sId;
	private String mNum;
	private String[] cuNumList;
	private int qty;
	private String hotice_option;
	private int mPrice;
	private String mName;
	private String cId;
	
	
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public String getmNum() {
		return mNum;
	}
	public void setmNum(String mNum) {
		this.mNum = mNum;
	}


	public String[] getCuNumList() {
		return cuNumList;
	}
	public void setCuNumList(String[] cuNumList) {
		this.cuNumList = cuNumList;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}


	public String getHotice_option() {
		return hotice_option;
	}
	public void setHotice_option(String hotice_option) {
		this.hotice_option = hotice_option;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	@Override
	public String toString() {
		return "CartVO [sId=" + sId + ", mNum=" + mNum + ", cuNumList=" + Arrays.toString(cuNumList) + ", qty=" + qty
				+ ", hotice_option=" + hotice_option + ", mPrice=" + mPrice + ", mName=" + mName + ", cId=" + cId + "]";
	}


}

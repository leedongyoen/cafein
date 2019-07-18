package co.yedam.cafein.vo;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class MenuOrderVO {


	private String cId;
	private String mNum;
	private String cuNum;
	private String[] cuoptionlist; // 옵션 저장.
	private String caNum;
	private String recipeno;
	
	// java에서 필요한 부분
	private String sId;
	private String hotice_option;
	private String stNum;
	private String sName;
	private String mPrice;
	private String mName;
	private String orderqty;
	private String totalPrice;
	
	
	
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmPrice() {
		return mPrice;
	}
	public void setmPrice(String mPrice) {
		this.mPrice = mPrice;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	

	public String getOrderqty() {
		return orderqty;
	}
	public void setOrderqty(String orderqty) {
		this.orderqty = orderqty;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
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


	public String[] getCuoptionlist() {
		return cuoptionlist;
	}
	public void setCuoptionlist(String[] cuoptionlist) {
		this.cuoptionlist = cuoptionlist;
	}
	public String getCaNum() {
		return caNum;
	}
	public void setCaNum(String caNum) {
		this.caNum = caNum;
	}
	public String getRecipeno() {
		return recipeno;
	}
	public void setRecipeno(String recipeno) {
		this.recipeno = recipeno;
	}

	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	
	public String getHotice_option() {
		return hotice_option;
	}
	public void setHotice_option(String hotice_option) {
		this.hotice_option = hotice_option;
	}
	public String getStNum() {
		return stNum;
	}
	public void setStNum(String stNum) {
		this.stNum = stNum;
	}
	@Override
	public String toString() {
		return "MenuOrderVO [cId=" + cId + ", mNum=" + mNum + ", cuNum=" + cuNum + ", cuoptionlist="
				+ Arrays.toString(cuoptionlist) + ", caNum=" + caNum + ", recipeno=" + recipeno + ", sId=" + sId
				+ ", hotice_option=" + hotice_option + ", stNum=" + stNum + ", sName=" + sName + ", mPrice=" + mPrice
				+ ", mName=" + mName + ", orderqty=" + orderqty + ", totalPrice=" + totalPrice + "]";
	}


	
}

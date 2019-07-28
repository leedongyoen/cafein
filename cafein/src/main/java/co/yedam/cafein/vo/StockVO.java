package co.yedam.cafein.vo;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(ignoreUnknown = true)
public class StockVO {

	private String stNum;
	private String sId;
	private String stName;
	private int stQty;
	private double stAqty;
	private int stPrice;
	private String caNum;
	private double stanUnit;
	private String stStatus;
	private String stUnit;
	
	private int enterQty;
	private int lackQty;
	
	private int recipeCnt;
	private String[] stNumList;
	private String stStatusNm;
	private String caNm;
	private int truthQty;		// 입력받은 실수량이 담길 변수(테이블 컬럼은 없어졌지만 변수는 필요함)
	private int rank;			// 재고 소모율에 따른 순위
	
	
	public double getStAqty() {
		return stAqty;
	}
	public void setStAqty(double stAqty) {
		this.stAqty = stAqty;
	}
	public double getStanUnit() {
		return stanUnit;
	}
	public void setStanUnit(double stanUnit) {
		this.stanUnit = stanUnit;
	}
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
	
	public String getStStatus() {
		return stStatus;
	}
	public void setStStatus(String stStatus) {
		this.stStatus = stStatus;
	}

	
	
	public String[] getStNumList() {
		return stNumList;
	}
	public void setStNumList(String[] stNumList) {
		this.stNumList = stNumList;
	}
	
	
	public String getStStatusNm() {
		return stStatusNm;
	}
	public void setStStatusNm(String stStatusNm) {
		this.stStatusNm = stStatusNm;
	}
	public String getCaNm() {
		return caNm;
	}
	public void setCaNm(String caNm) {
		this.caNm = caNm;
	}
	
	public int getTruthQty() {
		return truthQty;
	}
	public void setTruthQty(int truthQty) {
		this.truthQty = truthQty;
	}
	
	
	public String getStUnit() {
		return stUnit;
	}
	public void setStUnit(String stUnit) {
		this.stUnit = stUnit;
	}
	
	
	public int getEnterQty() {
		return enterQty;
	}
	public void setEnterQty(int enterQty) {
		this.enterQty = enterQty;
	}
	public int getLackQty() {
		return lackQty;
	}
	public void setLackQty(int lackQty) {
		this.lackQty = lackQty;
	}
	

	public int getRecipeCnt() {
		return recipeCnt;
	}
	public void setRecipeCnt(int recipeCnt) {
		this.recipeCnt = recipeCnt;
	}
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "StockVO [stNum=" + stNum + ", sId=" + sId + ", stName=" + stName + ", stQty=" + stQty + ", stAqty="
				+ stAqty + ", stPrice=" + stPrice + ", caNum=" + caNum + ", stanUnit=" + stanUnit + ", stStatus="
				+ stStatus + ", stUnit=" + stUnit + ", enterQty=" + enterQty + ", lackQty=" + lackQty + ", recipeCnt="
				+ recipeCnt + ", stNumList=" + Arrays.toString(stNumList) + ", stStatusNm=" + stStatusNm + ", caNm="
				+ caNm + ", truthQty=" + truthQty + ", rank=" + rank + "]";
	}
	
	
}
